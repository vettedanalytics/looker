view: vaccination_report {
  sql_table_name: analytics.vaccination_report ;;

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

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: date {
    type: string
    sql: ${TABLE}.date ;;
  }

  dimension: serial {
    type: string
    sql: ${TABLE}.serial ;;
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
