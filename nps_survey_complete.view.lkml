view: nps_survey_complete {
  sql_table_name: vethub.nps_survey_complete ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    hidden: yes
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: context_library_name {
    hidden: yes
    type: string
    sql: ${TABLE}.context_library_name ;;
  }

  dimension: context_library_version {
    hidden: yes
    type: string
    sql: ${TABLE}.context_library_version ;;
  }

  dimension: event {
    hidden: yes
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: event_text {
    hidden: yes
    type: string
    sql: ${TABLE}.event_text ;;
  }

  dimension_group: original_timestamp {
    hidden: yes
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
    sql: ${TABLE}.original_timestamp ;;
  }

  dimension_group: received {
    hidden: yes
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

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension_group: sent {
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
    sql: ${TABLE}.sent_at ;;
  }

  dimension_group: timestamp {
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
    sql: ${TABLE}.timestamp ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: uuid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.uuid ;;
  }

  dimension_group: uuid_ts {
    hidden: yes
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
    sql: ${TABLE}.uuid_ts ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [id, context_library_name]
  }
}
