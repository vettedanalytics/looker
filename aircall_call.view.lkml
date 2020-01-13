view: aircall_call {
  sql_table_name: raw_data.aircall_call ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: answered {
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
    sql: ${TABLE}.answered_at ;;
  }

  dimension: archived {
    type: yesno
    sql: ${TABLE}.archived ;;
  }

  dimension: asset {
    type: string
    sql: ${TABLE}.asset ;;
  }

  dimension: assigned_to {
    type: string
    sql: ${TABLE}.assigned_to ;;
  }

  dimension: comments {
    type: string
    sql: ${TABLE}.comments ;;
  }

  dimension: contact_id {
    type: number
    sql: ${TABLE}.contact_id ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: direct_link {
    type: string
    sql: ${TABLE}.direct_link ;;
  }

  dimension: direction {
    type: string
    sql: ${TABLE}.direction ;;
  }

  dimension: duration {
    type: number
    sql: ${TABLE}.duration ;;
  }

  dimension_group: ended {
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
    sql: ${TABLE}.ended_at ;;
  }

  dimension: missed_call_reason {
    type: string
    sql: ${TABLE}.missed_call_reason ;;
  }

  dimension: number_id {
    type: number
    sql: ${TABLE}.number_id ;;
  }

  dimension: raw_digits {
    type: string
    sql: ${TABLE}.raw_digits ;;
  }

  dimension: recording {
    type: string
    sql: ${TABLE}.recording ;;
  }

  dimension_group: started {
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
    sql: ${TABLE}.started_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: tags {
    type: string
    sql: ${TABLE}.tags ;;
  }

  dimension: transferred_to {
    type: string
    sql: ${TABLE}.transferred_to ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: voicemail {
    type: string
    sql: ${TABLE}.voicemail ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
