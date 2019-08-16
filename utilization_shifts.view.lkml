view: utilization_shifts {
  sql_table_name: postgres_database.utilization_shifts ;;

  dimension: id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: _sdc_batched {
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
    sql: ${TABLE}._sdc_batched_at ;;
  }

  dimension_group: _sdc_received {
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
    sql: ${TABLE}._sdc_received_at ;;
  }

  dimension: _sdc_sequence {
    hidden: yes
    type: number
    sql: ${TABLE}._sdc_sequence ;;
  }

  dimension: _sdc_table_version {
    hidden: yes
    type: number
    sql: ${TABLE}._sdc_table_version ;;
  }

  dimension: appointment_count {
    hidden: yes
    type: number
    sql: ${TABLE}.appointment_count ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      day_of_month
    ]
    sql: ${TABLE}.date ;;
  }

  dimension: day_of_week {
    type: string
    sql: ${TABLE}.day_of_week ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_time ;;
  }

  dimension: service_area_id {
    hidden: yes
    type: number
    sql: ${TABLE}.service_area_id ;;
  }

  dimension: slot_count {
    hidden: yes
    type: number
    sql: ${TABLE}.slot_count ;;
  }

  dimension: slot_length {
    hidden: yes
    type: number
    sql: ${TABLE}.slot_length ;;
  }

  dimension_group: start {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      hour_of_day
    ]
    sql: ${TABLE}.start_time ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: vet_id {
    hidden: yes
    type: number
    sql: ${TABLE}.vet_id ;;
  }

  measure: slots {
    type: sum
    sql: ${slot_count} ;;
  }

  measure: appointments {
    type: sum
    sql: ${appointment_count} ;;
  }

  measure: utilization_rate {
    type: number
    value_format_name: percent_2
    sql: ${appointments} / (1.0*nullif(${slots},0));;
  }

}
