view: medication_report {
  sql_table_name: analytics.medication_report ;;

  dimension_group: appointment {
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
    sql: ${TABLE}.appointment_at ;;
  }

  dimension: appointment_id {
    type: number
    sql: ${TABLE}.appointment_id ;;
  }

  dimension: approval {
    type: string
    sql: ${TABLE}.approval ;;
  }

  dimension: billing_quantity {
    type: number
    sql: ${TABLE}.billing_quantity ;;
  }

  dimension: dashboard_link {
    type: string
    sql: ${TABLE}.dashboard_link ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: dispensed_quantity {
    type: number
    sql: ${TABLE}.dispensed_quantity ;;
  }

  dimension: medication {
    type: string
    sql: ${TABLE}.medication ;;
  }

  dimension: quantity {
    type: string
    sql: ${TABLE}.quantity ;;
  }

  dimension: technician_name {
    type: string
    sql: ${TABLE}.technician_name ;;
  }

  dimension: vet_name {
    type: string
    sql: ${TABLE}.vet_name ;;
  }

  measure: count {
    type: count
    drill_fields: [technician_name, vet_name]
  }
}
