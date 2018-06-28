connection: "vetted_marketing"

 # include all views in this project
include: "*.view.lkml"

# include all dashboards in this project
include: "*.dashboard.lookml"

datagroup: segment_datagroup {
  sql_trigger: select count(*) from javascript.tracks;;
  max_cache_age: "1 hour"
}

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
