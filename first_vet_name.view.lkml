# If necessary, uncomment the line below to include explore_source.
# include: "Revenue.model.lkml"

view: first_vet_name {
  derived_table: {
    explore_source: appointments {
      column: id { field: client_faq.id }
      column: first_appointment_date { field: client_faq.first_appointment_date }
      column: name { field: vets.name }
    }
  }
  dimension: id {
    type: number
  }
  dimension: first_appointment_date {
    type: date
  }
  dimension: name {}
}
