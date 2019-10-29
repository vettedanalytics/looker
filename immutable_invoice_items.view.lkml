view: immutable_invoice_items {
  sql_table_name: postgres_database.immutable_invoice_items ;;

  dimension: id {
    primary_key: yes
    hidden: yes
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

  dimension: amount {
    label: "Price"
    type: number
    sql: ${TABLE}.amount ;;
    value_format_name: usd
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_num,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: invoice_id {
    type: number
    sql: ${TABLE}.invoice_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: patient_id {
    hidden: yes
    type: number
    sql: ${TABLE}.patient_id ;;
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

  dimension: user_id {
    hidden: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    description: "Count of inovice line items"
    type: count
    drill_fields: [id, name, invoices.id]
  }

  measure: total_invoice_amount {
    description: "Total invoice amount"
    type: sum
    value_format_name: usd
    sql: ${amount} ;;
  }

  measure: revenue_per_appointment  {
    type: number
    value_format_name: "usd"
    sql: ${total_invoice_amount} / ${appointments.count} ;;
  }

  measure: running_total_invoice_amount {
    type:  running_total
    value_format_name: usd
    sql: ${total_invoice_amount} ;;
  }
}
