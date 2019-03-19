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

explore: vw_users {
  label: "Email Utilities"
  join: clients {
    sql_on: ${vw_users.id} = ${clients.user_id} ;;
    relationship: many_to_one
  }
  join: appointments {
    sql_on: ${clients.id} = ${appointments.client_id} ;;
    fields: [appointments.count]
    relationship: one_to_many
  }
  join: nps_survey_complete {
    sql_on: ${clients.id} = ${nps_survey_complete.user_id};;
    relationship: one_to_many
  }
}
