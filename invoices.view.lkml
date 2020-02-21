view: invoices {
  sql_table_name: raw_data.invoices ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: appointment_id {
    type: number
    sql: ${TABLE}.appointment_id ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: complete {
    type: yesno
    sql: ${TABLE}.complete ;;
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
      year,
      day_of_month
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: last_charged {
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
    sql: ${TABLE}.last_charged ;;
  }

  dimension: subscription_exam {
    type: yesno
    sql: ${TABLE}.subscription_exam ;;
  }

  dimension: tech_payment {
    type: number
    sql: ${TABLE}.tech_payment ;;
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

  dimension: vetpronto_commission {
    type: number
    sql: ${TABLE}.vetpronto_commission ;;
  }

  measure: count {
    type: count
    drill_fields: [id, immutable_invoice_items.count]
  }
}
