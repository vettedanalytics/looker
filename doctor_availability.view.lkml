view: doctor_availability {
  sql_table_name: analytics.doctor_availability ;;

  dimension: appttime {
    type: number
    sql: ${TABLE}.appttime ;;
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

  dimension: hours {
    type: number
    sql: ${TABLE}.hours ;;
  }

  dimension: minutes {
    type: number
    sql: ${TABLE}.minutes ;;
  }

  dimension: service_area {
    type: string
    sql: ${TABLE}."service area" ;;
    case_sensitive: no
  }

  dimension: service_area_id {
    type: number
    sql: ${TABLE}."service area id" ;;
  }

  dimension: slotmonth {
    type: date_month_num
    sql: ${TABLE}.slotdate ;;
  }

  dimension_group: slotdate {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.slotdate ;;
  }

  dimension: slots {
    type: number
    sql: ${TABLE}.slots ;;
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

  dimension: vet_name {
    type: string
    sql: ${TABLE}."vet name" ;;
  }

  dimension: vetid {
    type: number
    value_format_name: id
    sql: ${TABLE}.vetid ;;
  }

  dimension: service_metro_area {
    type: string
    sql: ${TABLE}."service metro area" ;;
    case_sensitive: no
  }

  measure: sum {
    type: sum
    sql: ${TABLE}.slots ;;
  }
}
