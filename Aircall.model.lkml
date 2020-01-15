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
explore: aircall_call {
  label: "Aircall Calls"
}

explore: aircall_contact {
  label: "Aircall Contacts"
}

explore: aircall_number {
  label: "Aircall Numbers"
}

explore: aircall_team {
  label: "Aircall Team"
}

explore: aircall_user {
  label: "Aircall Users"
}
