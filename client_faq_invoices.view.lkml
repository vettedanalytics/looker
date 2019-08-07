view: client_faq_invoices {
# If necessary, uncomment the line below to include explore_source.
# include: "Revenue.model.lkml"
  derived_table: {
    explore_source: clients {
      column: id { field: clients.id }
      column: lifetime_value { field: immutable_invoice_items.total_invoice_amount }
      column: lifetime_appointments_count {field:appointments.confirmed_appointments}
      column: count {}
      column: first_appointment {}
      column: last_appointment {}
    }
  }
  dimension: id {
    type: number
  }
  dimension: lifetime_value {
    value_format: "$#,##0.00"
    type: number
  }
  dimension: lifetime_appointments_count {
    description: ""
    type: number
  }
  dimension: count {
    hidden: yes
    type: number
  }
  dimension_group: first_appointment {
    type: time
    timeframes: [
      date,
      week,
      month,
      year,
      time,
      day_of_week
    ]
  }
  dimension_group: last_appointment  {
    type: time
    timeframes: [
      date,
      week,
      month,
      year,
      time,
      day_of_week
    ]
  }
  dimension: first_vet_seen {
    sql: ${first_vet_seen.name} ;;
  }
}
