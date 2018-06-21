connection: "vetted_marketing"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: ryan_test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ryan_test_default_datagroup

explore: combined_charges {
  label: "Revenue"
  view_label: "Charges"
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
  join: appointments {
    sql_on: ${combined_charges.created_hour} = ${appointments.start_hour};;
    relationship: many_to_one
    view_label: "Appointments"
  }

}
