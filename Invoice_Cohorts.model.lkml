connection: "vetted_marketing"

include: "*.view.lkml"

datagroup: ryan_test_default_datagroup {
  sql_trigger: select count(*) from stripe_vetpronto.charges;;
  max_cache_age: "1 hour"
}

persist_with: ryan_test_default_datagroup

explore: clients {
  label: "Client Invoices"
  join: invoices {
    view_label: "Invoices"
    sql_on: ${clients.id} = ${invoices.client_id} ;;
    relationship: one_to_many
  }
  join: immutable_invoice_items {
    view_label: "Invoice Items"
    sql_on: ${invoices.id}  = ${immutable_invoice_items.invoice_id};;
    relationship: one_to_many
  }
  join: appointments {
    view_label: "Appointments"
    sql_on: ${clients.id} = ${appointments.client_id} ;;
    relationship: one_to_many
    fields: [appointments.confirmed_appointments, appointments.confirmed, appointments.created_date, appointments.count, appointments.created_month ]
  }
  join: service_area_zips{
    view_label: "Service Areas"
    sql_on: ${clients.zip_code} = ${service_area_zips.zipcode};;
    relationship: one_to_one
    fields: [service_area_zips.name]
  }
  join: zipcode_region {
    type:  inner
    sql_on: ${clients.zip_code} = ${zipcode_region.zipcode} ;;
    relationship: one_to_one
  }
  }
