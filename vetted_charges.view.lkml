view: vetted_charges {
  sql_table_name: stripe_vetted.charges ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: amount_refunded {
    type: number
    sql: ${TABLE}.amount_refunded ;;
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
      day_of_month,
      year
    ]
    sql: ${TABLE}.created ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: failure_code {
    type: string
    sql: ${TABLE}.failure_code ;;
  }

  dimension: failure_message {
    type: string
    sql: ${TABLE}.failure_message ;;
  }

  dimension: fraud_details_stripe_report {
    type: string
    sql: ${TABLE}.fraud_details_stripe_report ;;
  }

  dimension: metadata_order_id {
    type: string
    sql: ${TABLE}.metadata_order_id ;;
  }

  dimension: paid {
    type: yesno
    sql: ${TABLE}.paid ;;
  }

  dimension_group: received {
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

  dimension_group: uuid_ts {
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
    type: count
    drill_fields: [id]
  }
}
