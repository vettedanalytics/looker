view: combined_charges {
  derived_table: {
    sql_trigger_value: SELECT COUNT(*) FROM stripe_vetpronto.charges ;;
    sql: select amount, card_id, customer_id, id, created, status, failure_code, amount_refunded, 'vetted' as company
      from stripe_vetted.charges
      union all
      select amount, card_id, customer_id, id, created, status, failure_code, amount_refunded, 'vetpronto' as company
      from stripe_vetpronto.charges
       ;;
    distribution_style: all
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_refunded {
    type: sum
    value_format_name: usd
    sql: ${amount_refunded} ;;
  }

  measure: total_amount {
    type:  sum
    value_format_name: usd
    filters: {
      field: status
      value: "succeeded"
    }
    sql: ${amount};;
  }

  measure: revenue {
    type: number
    value_format_name: usd
    sql: ${total_amount} - ${total_refunded} ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount / 100;;
  }

  dimension: card_id {
    type: string
    sql: ${TABLE}.card_id ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    sql: ${TABLE}.created ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: status {
    type:  string
    sql:  ${TABLE}.status ;;
  }

  dimension: failure_code {
    type:  string
    sql: ${TABLE}.failure_code ;;
  }

  dimension: amount_refunded {
    type: number
    sql:  ${TABLE}.amount_refunded / 100 ;;
  }

  set: detail {
    fields: [
      amount,
      card_id,
      customer_id,
      id,
      created_time,
      company
    ]
  }
}
