view: rosnick_charges {
  sql_table_name: stripe_rosnick.charges ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount / 100;;
  }

  dimension: amount_refunded {
    type: number
    sql: ${TABLE}.amount_refunded / 100;;
  }

  dimension: balance_transaction_id {
    type: string
    sql: ${TABLE}.balance_transaction_id ;;
  }

  dimension: captured {
    type: yesno
    sql: ${TABLE}.captured ;;
  }

  dimension: card_id {
    type: string
    sql: ${TABLE}.card_id ;;
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
    sql: ${TABLE}.created ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: failure_message {
    type: string
    sql: ${TABLE}.failure_message ;;
  }

  dimension: paid {
    type: yesno
    sql: ${TABLE}.paid ;;
  }

  dimension: receipt_email {
    type: string
    sql: ${TABLE}.receipt_email ;;
  }

  dimension: refunded {
    type: yesno
    sql: ${TABLE}.refunded ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: uuid {
    type: number
    value_format_name: id
    sql: ${TABLE}.uuid ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
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
}
