connection: "vetted_marketing"

# include all the views
include: "*.view"

# include all the dashboards
# include: "*.dashboard"

datagroup: ryan_test_default_datagroup {
  sql_trigger: select count(*) from stripe_vetpronto.charges;;
  max_cache_age: "1 hour"
}

persist_with: ryan_test_default_datagroup

# explore: appointments{
#   label: "Revenue"
#   view_label: "Appointments"
#   persist_with: ryan_test_default_datagroup
#   join: combined_charges {
#     sql_on: ${appointments.start_date} = ${combined_charges.created_date};;
#     relationship: many_to_many
#     view_label: "Charges"
#   }
#   join: combined_cards {
#     sql_on: ${combined_charges.customer_id} = ${combined_cards.customer_id};;
#     relationship: many_to_many
#     view_label: "Cards"
#   }
#   join: combined_customers {
#     sql_on: ${combined_charges.customer_id} = ${combined_customers.id};;
#     relationship: many_to_one
#     view_label: "Customers"
#   }
#   join: clients {
#     sql_on: ${combined_charges.customer_id} = ${clients.stripe_token};;
#     relationship: many_to_one
#     view_label: "Clients"
#   }
#   join: users {
#     sql_on: ${clients.user_id} = ${users.id} ;;
#     relationship: one_to_one
#     view_label: "Users"
#   }
#   join: chargebee_clients {
#     from: clients
#     sql_on: ${combined_customers.chargebee_id} = ${chargebee_clients.chargebee_id} ;;
#     relationship: one_to_one
#   }
#   join: vets {
#     sql_on: ${appointments.vet_id} = ${vets.id};;
#   }
# }

explore: appointments {
  label: "Revenue"
  join: invoices {
    sql_on: ${appointments.id} = ${invoices.appointment_id} ;;
    fields: []
    relationship: one_to_many
  }
  join: immutable_invoice_items {
    view_label: "Invoice Items"
    sql_on: ${invoices.id}  = ${immutable_invoice_items.invoice_id};;
    relationship: one_to_many
  }
  join: clients {
    sql_on: ${appointments.client_id} = ${clients.id} ;;
    relationship: many_to_one
  }
  join: users {
    sql_on: ${clients.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
  join: zipcode_region {
    type:  full_outer
    sql_on: ${clients.zip_code} = ${zipcode_region.zipcode} ;;
    relationship: one_to_one
  }
  join: promo_codes {
    sql_on: ${appointments.promo_code_id} = ${promo_codes.id} ;;
    relationship: many_to_one
    fields: [promo_codes.analytics_code, promo_codes.discount]
  }
  join: vw_users {
    sql_on: ${clients.user_id} = ${vw_users.id} ;;
    relationship: one_to_one
  }
  join: appointment_patients {
    sql_on: ${appointments.id} = ${appointment_patients.appointment_id};;
    relationship: one_to_many
  }
  join: patients {
    sql_on: ${clients.id} = ${patients.client_id} ;;
    relationship:  one_to_many
  }
  join: vets {
    sql_on: ${appointments.vet_id} = ${vets.id} or ${appointments.secondary_id} = ${vets.id} ;;
    relationship: many_to_one
  }
  join: client_faq {
    view_label: "Client FAQ"
    sql_on: ${clients.id} = ${client_faq.id} ;;
    relationship: one_to_one
  }
  join: service_areas {
    sql_on: ${appointments.service_area_id} = ${service_areas.id} ;;
    relationship: one_to_one
  }
  join: first_vet_seen {
    sql_on: ${client_faq.id} = ${first_vet_seen.id} ;;
    fields: []
    relationship: one_to_one
  }
}

explore: combined_charges {
  label: "Stripe"
  join: vw_users {
    sql_on: ${combined_charges.email} = ${vw_users.email} ;;
    relationship: one_to_many
  }
  join: clients {
    sql_on: ${vw_users.id} = ${clients.id} ;;
    relationship: one_to_one
  }
  join: appointments {
    sql_on: ${clients.id} = ${appointments.client_id} ;;
    relationship: one_to_many
  }
  join: client_faq {
    view_label: "Client FAQ"
    sql_on: ${clients.id} = ${client_faq.id} ;;
    relationship: one_to_one
  }
  join: first_vet_seen {
    sql_on: ${client_faq.id} = ${first_vet_seen.id} ;;
    fields: []
    relationship: one_to_one
  }
  join: combined_cards {
    sql_on: ${combined_charges.card_id} = ${combined_cards.id} ;;
    relationship: many_to_one
  }
  join: combined_customers {
    sql_on: ${combined_cards.customer_id} = ${combined_customers.id} ;;
    relationship: many_to_one
  }
}

explore: rosnick_charges {
  label: "Rosnick Stripe"
}
