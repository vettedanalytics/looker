view: daily_charges {
  derived_table: {
    sql: select (DATE(combined_charges.created )), combined_charges.company, sum(combined_charges.amount / 100 ) as "Total Revenue", sum(amount_refunded / 100) as "Total Refunded"
      from ${combined_charges.SQL_TABLE_NAME} as "combined_charges"
      group by DATE(combined_charges.created ), combined_charges.company
       ;;
      distribution_style: even
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: total_revenue {
    type: number
    label: "total revenue"
    sql: ${TABLE}."total revenue" ;;
  }

  dimension: total_refunded {
    type: number
    label: "total refunded"
    sql: ${TABLE}."total refunded" ;;
  }

  set: detail {
    fields: [date, company, total_revenue, total_refunded]
  }
}
