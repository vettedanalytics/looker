connection: "vetted_marketing"

include: "*.view.lkml"                       # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

explore: utilization_shifts {
  label: "Utlization"
  join: vets {
    sql_on: ${utilization_shifts.vet_id} = ${vets.id} ;;
    relationship: many_to_one
    fields: [vets.name]
  }
  join: service_areas {
    sql_on: ${utilization_shifts.service_area_id} = ${service_areas.id} ;;
    relationship: many_to_one
    fields: [service_areas.name]
  }
}
