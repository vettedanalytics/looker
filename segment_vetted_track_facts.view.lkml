# Determines event sequence numbers within session

view: segment_vetted_track_facts {
  derived_table: {
    sql_trigger_value: select count(*) from ${segment_vetted_session_tracks.SQL_TABLE_NAME} ;;
    sortkeys: ["event_id"]
    distribution: "looker_visitor_id"
    sql: select t.anonymous_id
          , t.received_at
          , t.event_id
          , t.uuid
          , t.event
          , s.session_id
          , t.looker_visitor_id
          , row_number() over(partition by s.session_id order by t.received_at) as track_sequence_number
        from ${segment_vetted_mapped_tracks.SQL_TABLE_NAME} as t
        inner join ${segment_vetted_session_tracks.SQL_TABLE_NAME} as s
        on t.looker_visitor_id = s.looker_visitor_id
        -- on t.anonymous_id = s.anonymous_id
          and t.received_at >= s.session_start_at
          and (t.received_at < s.next_session_start_at or s.next_session_start_at is null)
       ;;
  }

  dimension: event_id {
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.event_id ;;
  }

  dimension: event {
    hidden: yes
    sql: ${TABLE}.event ;;
  }

  dimension: uuid {
    hidden: yes
    sql: ${TABLE}.uuid ;;
  }

  dimension: session_id {
    sql: ${TABLE}.session_id ;;
  }

  dimension: looker_visitor_id {
    sql: ${TABLE}.looker_visitor_id ;;
  }

  dimension: anonymous_id {
    sql: ${TABLE}.anonymous_id ;;
    hidden: yes
  }

  dimension: sequence_number {
    type: number
    sql: ${TABLE}.track_sequence_number ;;
  }

  dimension_group: received {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.received_at ;;
  }

  measure: count_visitors {
    type: count_distinct
    sql: ${looker_visitor_id} ;;
    drill_fields: [anonymous_id]
  }
}
