connection: "vetted_marketing"

include: "*.view.lkml"                       # include all views in this project

explore: canceled_appointments {
  label: "Cancelations"
}
