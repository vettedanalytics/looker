# If necessary, uncomment the line below to include explore_source.
# include: "Revenue.model.lkml"

view: first_vet_seen {
  derived_table: {
    explore_source: appointments {
      column: id { field: clients.id }
      column: name { field: vets.name }
      filters: {
        field: appointments.is_first_appointment
        value: "Yes"
      }
    }
  }
  dimension: id {
    hidden: yes
    type: number
  }
  dimension: name {}
}
