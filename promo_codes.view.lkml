view: promo_codes {
  sql_table_name: raw_data.promo_codes ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: admin_message {
    type: string
    sql: ${TABLE}.admin_message ;;
  }

  dimension: analytics_code {
    type: string
    sql: ${TABLE}.analytics_code ;;
  }

  dimension_group: appointments_from {
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
    sql: ${TABLE}.appointments_from ;;
  }

  dimension_group: appointments_to {
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
    sql: ${TABLE}.appointments_to ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: client_message {
    type: string
    sql: ${TABLE}.client_message ;;
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

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: discount {
    type: number
    sql: ${TABLE}.discount ;;
  }

  dimension_group: expires {
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
    sql: ${TABLE}.expires_on ;;
  }

  dimension: is_regex {
    type: yesno
    sql: ${TABLE}.is_regex ;;
  }

  dimension: new_customer_only {
    type: yesno
    sql: ${TABLE}.new_customer_only ;;
  }

  dimension: single_use {
    type: yesno
    sql: ${TABLE}.single_use ;;
  }

  dimension: skip_cc {
    type: yesno
    sql: ${TABLE}.skip_cc ;;
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

  measure: count {
    type: count
    drill_fields: [id]
  }
}
