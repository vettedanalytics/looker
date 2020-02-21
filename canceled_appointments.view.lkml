view: canceled_appointments {
  sql_table_name: raw_data.canceled_appointments ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: canceling_user_id {
    type: number
    sql: ${TABLE}.canceling_user_id ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: confirmed {
    type: yesno
    sql: ${TABLE}.confirmed ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_time ;;
  }

  dimension: old_appointment_id {
    type: number
    sql: ${TABLE}.old_appointment_id ;;
  }

  dimension: reasons {
    type: string
    sql: ${TABLE}.reasons ;;
  }

  dimension: cancelation_reason {
    type: string
    sql: ${TABLE}."cancelation_reason" ;;
  }

  set: cancelation_reason_count {
    fields: [cancelation_reason, count]
  }

  dimension: secondary_id {
    type: number
    sql: ${TABLE}.secondary_id ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_time ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: vet_id {
    type: number
    sql: ${TABLE}.vet_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
