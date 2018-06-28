connection: "vetted_marketing"

 # include all views in this project
include: "*.view.lkml"

# include all dashboards in this project
include: "*.dashboard.lookml"

datagroup: segment_datagroup {
  sql_trigger: select count(*) from javascript.tracks;;
  max_cache_age: "1 hour"
}

explore: segment_combined_tracks {
  label: "Events & Tracks"
  view_label: "Tracks"
  persist_with: segment_datagroup
  }
