connection: "vetted_marketing"

# include all views in this project
include: "*.view.lkml"

# include all dashboards in this project
include: "*.dashboard.lookml"

datagroup: adwords_datagroup {
  sql_trigger: select count(*) from adwords.campaign_performance_reports;;
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

explore: combined_campaign_performance_reports {
  join: combined_campaigns {
    relationship: many_to_one
    sql_on: ${combined_campaign_performance_reports.campaign_id} = ${combined_campaigns.id} ;;
  }
  join: combined_ad_groups {
    relationship: one_to_many
    sql_on: ${combined_ad_groups.campaign_id} = ${combined_campaigns.id} ;;
  }
  join: phone_call {
    relationship: one_to_many
    sql_on: ${combined_campaigns.name} = ${phone_call.utm_campaign}};;
  }
}
