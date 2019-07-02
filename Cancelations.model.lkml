connection: "vetted_marketing"

include: "*.view.lkml"                       # include all views in this project

explore: canceled_appointments {
  label: "Cancelations"
  join: clients {
    sql_on: ${canceled_appointments.client_id} = ${clients.id} ;;
    relationship: one_to_one
  }
  join: vets {
    sql_on: ${canceled_appointments.vet_id} = ${vets.id} ;;
    relationship: one_to_one
  }
}
