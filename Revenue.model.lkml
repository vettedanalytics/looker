connection: "vetted_marketing"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: ryan_test_default_datagroup {
  sql_trigger: select count(*) from stripe_vetpronto.charges;;
  max_cache_age: "1 hour"
}

persist_with: ryan_test_default_datagroup

explore: appointments {
  label: "Revenue"
  view_label: "Appointments"
  persist_with: ryan_test_default_datagroup
  join: combined_charges {
    sql_on: ${appointments.start_date} = ${combined_charges.created_date};;
    relationship: many_to_many
    view_label: "Charges"
  }
  join: combined_cards {
    sql_on: ${combined_charges.customer_id} = ${combined_cards.customer_id};;
    relationship: many_to_many
    view_label: "Cards"
  }
  join: combined_customers {
    sql_on: ${combined_charges.customer_id} = ${combined_customers.id};;
    relationship: many_to_one
    view_label: "Customers"
  }
  join: clients {
    sql_on: ${combined_charges.customer_id} = ${clients.stripe_token};;
    relationship: many_to_one
    view_label: "Clients"
  }
  join: chargebee_clients {
    from: clients
    sql_on: ${combined_customers.chargebee_id} = ${chargebee_clients.chargebee_id} ;;
    relationship: one_to_one
  }
}
