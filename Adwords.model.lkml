connection: "vetted_marketing"

# include all views in this project
include: "*.view.lkml"

# include all dashboards in this project
include: "*.dashboard.lookml"

datagroup: ryan_test_default_datagroup {
  sql_trigger: select count(*) from stripe_vetpronto.charges;;
  max_cache_age: "1 hour"
}

explore: combined_ad_performance_reports {
  join: combined_ads {
   relationship: many_to_one
    sql_on: ${combined_ad_performance_reports.ad_id} = ${combined_ads.id} ;;
  }
  join: combined_ad_groups {
    relationship: many_to_one
    sql_on: ${combined_ads.ad_group_id} = ${combined_ad_groups.id} ;;
  }
  join: combined_campaigns {
    relationship: many_to_one
    sql_on: ${combined_ad_groups.campaign_id} = ${combined_campaigns.id} ;;
  }
}

#explore: campaign_performance_reports {
#  join: campaigns {
#    relationship: many_to_one
#    sql_on: ${campaign_performance_reports.campaign_id} = ${campaigns.id} ;;
#  }
#  join: ad_groups {
#    relationship: one_to_many
#    sql_on: ${ad_groups.campaign_id} = ${campaigns.id} ;;
#  }

#}
