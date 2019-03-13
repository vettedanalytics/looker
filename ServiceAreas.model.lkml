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

view: sql_runner_query {
  derived_table: {
    sql: select name, building, TRIM(UNNEST(zip_codes)) from service_areas
      where building=false
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: building {
    type: string
    sql: ${TABLE}.building ;;
  }

  dimension: btrim {
    type: zipcode
    sql: ${TABLE}.btrim ;;
  }

  set: detail {
    fields: [name, building, btrim]
  }
}

explore: service_area_zips{
  label: "Service Area Zips"
}
