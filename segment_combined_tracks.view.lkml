view: segment_combined_tracks {
  derived_table: {
    datagroup_trigger: segment_datagroup
    sql: select id, received_at, uuid, sent_at, user_id, context_campaign_term, context_page_path, context_page_referrer, context_page_url, context_campaign_content, context_campaign_source, context_library_version, context_page_search, event_text, context_library_name, context_user_agent, "timestamp", anonymous_id, context_campaign_medium, context_campaign_name, uuid_ts, context_ip, context_page_title, event, original_timestamp, 'vetted' as company
      from javascript.tracks
      union all
      select id, received_at, uuid, sent_at, user_id, context_campaign_term, context_page_path, context_page_referrer, context_page_url, context_campaign_content, context_campaign_source, context_library_version, context_page_search, event_text, context_library_name, context_user_agent, "timestamp", anonymous_id, context_campaign_medium, context_campaign_name, uuid_ts, context_ip, context_page_title, event, original_timestamp, 'vetpronto' as company
      from website.tracks
      limit 10
       ;;
      distribution_style: all
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: received_at {
    type: time
    sql: ${TABLE}.received_at ;;
  }

  dimension: uuid {
    type: number
    sql: ${TABLE}.uuid ;;
  }

  dimension_group: sent_at {
    type: time
    sql: ${TABLE}.sent_at ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: context_campaign_term {
    type: string
    sql: ${TABLE}.context_campaign_term ;;
  }

  dimension: context_page_path {
    type: string
    sql: ${TABLE}.context_page_path ;;
  }

  dimension: context_page_referrer {
    type: string
    sql: ${TABLE}.context_page_referrer ;;
  }

  dimension: context_page_url {
    type: string
    sql: ${TABLE}.context_page_url ;;
  }

  dimension: context_campaign_content {
    type: string
    sql: ${TABLE}.context_campaign_content ;;
  }

  dimension: context_campaign_source {
    type: string
    sql: ${TABLE}.context_campaign_source ;;
  }

  dimension: context_library_version {
    type: string
    sql: ${TABLE}.context_library_version ;;
  }

  dimension: context_page_search {
    type: string
    sql: ${TABLE}.context_page_search ;;
  }

  dimension: event_text {
    type: string
    sql: ${TABLE}.event_text ;;
  }

  dimension: context_library_name {
    type: string
    sql: ${TABLE}.context_library_name ;;
  }

  dimension: context_user_agent {
    type: string
    sql: ${TABLE}.context_user_agent ;;
  }

  dimension_group: timestamp {
    type: time
    sql: ${TABLE}.timestamp ;;
  }

  dimension: anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
  }

  dimension: context_campaign_medium {
    type: string
    sql: ${TABLE}.context_campaign_medium ;;
  }

  dimension: context_campaign_name {
    type: string
    sql: ${TABLE}.context_campaign_name ;;
  }

  dimension_group: uuid_ts {
    type: time
    sql: ${TABLE}.uuid_ts ;;
  }

  dimension: context_ip {
    type: string
    sql: ${TABLE}.context_ip ;;
  }

  dimension: context_page_title {
    type: string
    sql: ${TABLE}.context_page_title ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension_group: original_timestamp {
    type: time
    sql: ${TABLE}.original_timestamp ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  set: detail {
    fields: [
      id,
      received_at_time,
      uuid,
      sent_at_time,
      user_id,
      context_campaign_term,
      context_page_path,
      context_page_referrer,
      context_page_url,
      context_campaign_content,
      context_campaign_source,
      context_library_version,
      context_page_search,
      event_text,
      context_library_name,
      context_user_agent,
      timestamp_time,
      anonymous_id,
      context_campaign_medium,
      context_campaign_name,
      uuid_ts_time,
      context_ip,
      context_page_title,
      event,
      original_timestamp_time,
      company
    ]
  }
}
