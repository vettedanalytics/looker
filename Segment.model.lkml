connection: "vetted_marketing"

# include all views in this project
include: "*.view"

# include only specified dashboards
# include: "*.dashboard"

explore: segment_vetted_track_facts {
  view_label: "Events"
  label: "Events"

  join: segment_vetted_tracks {
    view_label: "Events"
    type: left_outer
    relationship: one_to_one
    sql_on: ${segment_vetted_tracks.uuid} = ${segment_vetted_track_facts.uuid} and
      ${segment_vetted_tracks.received_raw} = ${segment_vetted_track_facts.received_raw} and
      ${segment_vetted_tracks.anonymous_id} = ${segment_vetted_track_facts.anonymous_id}
       ;;
  }

  join: segment_vetted_session_tracks {
    view_label: "Sessions"
    type: left_outer
    sql_on: ${segment_vetted_track_facts.session_id} = ${segment_vetted_session_tracks.session_id} ;;
    relationship: many_to_one
  }

  join: segment_vetted_session_track_facts {
    view_label: "Sessions"
    type: left_outer
    sql_on: ${segment_vetted_track_facts.session_id} = ${segment_vetted_session_track_facts.session_id} ;;
    relationship: many_to_one
  }

  join: segment_vetted_user_session_facts {
    view_label: "Users"
    type: left_outer
    sql_on: ${segment_vetted_track_facts.looker_visitor_id} = ${segment_vetted_user_session_facts.looker_visitor_id} ;;
    relationship: many_to_one
  }

#   join: campaigns {
#     type: left_outer
#     relationship: many_to_one
#     sql_on: ${campaigns.id}=${tracks.context_campaign_name}
#             and ${tracks.context_campaign_source} ='google'
#             and ${tracks.context_campaign_source} is not null
#             ;;
#   }
#
#   join: campaign_performance_reports {
#     relationship: one_to_many
#     sql_on: ${campaign_performance_reports.campaign_id} = ${campaigns.id} ;;
#   }
}



##### These can be added to Events Explore: #####
#   join: users {
#     view_label: "Users"
#     type: left_outer
#     sql_on: ${user_session_facts.looker_visitor_id} = ${users.id} ;;
#     relationship: one_to_one
#   }

#   join: tracks_flow {
#     view_label: "Events Flow"
#     sql_on: ${track_facts.event_id} = ${tracks_flow.event_id} ;;
#     relationship: one_to_one
#   }
##### end #####

explore: segment_vetted_session_tracks {
  join: segment_vetted_session_track_facts {
    view_label: "sessions"
    sql_on: ${segment_vetted_session_tracks.session_id} = ${segment_vetted_session_track_facts.session_id} ;;
    relationship: one_to_one
  }

  join: segment_vetted_user_session_facts {
    view_label: "Users"
    sql_on: ${segment_vetted_session_tracks.looker_visitor_id} = ${segment_vetted_user_session_facts.looker_visitor_id} ;;
    relationship: many_to_one
  }
  join: segment_vetted_user_source_facts {
    view_label: "Source & Medium"
    sql_on: ${segment_vetted_user_session_facts.looker_visitor_id} = ${segment_vetted_user_source_facts.looker_visitor_id};;
    relationship: one_to_one
  }
}
explore: attribution_summary {
  label: "Marketing Attribution "
}

explore: daily_spend_summary {
  label: "Daily Marketing Spend"
}

explore: daily_cac_last_touch_channel {
  label: "Daily CAC - Last Touch Channel"
}

explore: daily_cac_first_touch_channel {
  label: "Daily CAC - First Touch Channel"
}


# explore: funnel_explorer {
#   join: sessions_trk {
#     view_label: "sessions"
#     foreign_key: session_id
#   }

#   join: user_session_facts {
#     view_label: "Users"
#     foreign_key: sessions_trk.looker_visitor_id
#   }

#   join: session_trk_facts {
#     view_label: "sessions"
#     relationship: one_to_one
#     foreign_key: session_id
#   }

#   join: users {
#     relationship: many_to_one
#     sql_on: coalesce(users.mapped_user_id, users.user_id) = sessions.user_id ;;
#   }
# }
