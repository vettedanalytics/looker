connection: "vetted_marketing"

# include all views in this project
include: "*.view.lkml"

# include all dashboards in this project
# include: "*.dashboard.lookml"

datagroup: adwords_datagroup {
  sql_trigger: select count(*) from adwords.campaign_performance_reports;;
  max_cache_age: "1 hour"
}

# explore: combined_ad_performance_reports {
#   join: combined_ads {
#    relationship: many_to_one
#     sql_on: ${combined_ad_performance_reports.ad_id} = ${combined_ads.id} ;;
#   }
#   join: combined_ad_groups {
#     relationship: many_to_one
#     sql_on: ${combined_ads.ad_group_id} = ${combined_ad_groups.id} ;;
#   }
#   join: combined_campaigns {
#     relationship: many_to_one
#     sql_on: ${combined_ad_groups.campaign_id} = ${combined_campaigns.id} ;;
#   }
# }

# explore: combined_campaign_performance_reports {
#   label: "Adwords Campaigns"
#   join: combined_campaigns {
#     relationship: many_to_one
#     sql_on: ${combined_campaign_performance_reports.campaign_id} = ${combined_campaigns.id} ;;
#   }
#   join: combined_ad_groups {
#     relationship: many_to_one
#     sql_on: ${combined_ad_groups.campaign_id} = ${combined_campaigns.id} ;;
#   }
#   join:   adwords_combined_click_performance_reports {
#     relationship: one_to_many
#     sql_on: ${adwords_combined_click_performance_reports.ad_group_id} = ${combined_ad_groups.id} ;;
#   }
#   join: phone_call {
#     relationship: many_to_one
#     sql_on: ${phone_call.gclid} = ${adwords_combined_click_performance_reports.gcl_id};;
#   }
#   join: vethub_tracks {
#     relationship: many_to_many
#     sql_on: ${phone_call.user_id} = ${vethub_tracks.user_id} ;;
#   }
# }

explore: adwords_combined_click_performance_reports {
  label: "Adwords Campaigns"
  join: combined_campaign_performance_reports {
     relationship: many_to_one
     sql_on: ${adwords_combined_click_performance_reports.campaign_id} = ${combined_campaign_performance_reports.campaign_id}
     and date_trunc('day', ${adwords_combined_click_performance_reports.date_start_raw}) = date_trunc('day', ${combined_campaign_performance_reports.start_raw});;
   }
  join: combined_campaigns {
    relationship:  one_to_one
    sql_on:${combined_campaign_performance_reports.campaign_id} = ${combined_campaigns.id} ;;
    fields: [combined_campaigns.name]
  }
  join: combined_ad_groups {
     relationship: many_to_one
     sql_on: ${combined_ad_groups.campaign_id} = ${combined_campaigns.id} ;;
    fields: [combined_ad_groups.name]
   }
  join: phone_call {
     relationship: many_to_one
     sql_on: ${phone_call.gclid} = ${adwords_combined_click_performance_reports.gcl_id};;
  }
  join: vethub_tracks {
     relationship: many_to_many
     sql_on: ${phone_call.user_id} = ${vethub_tracks.user_id}
     and date_trunc('day', ${phone_call.timestamp_raw}) = date_trunc('day', ${vethub_tracks.timestamp_raw}) ;;
  }

}
