view: attribution_summary {
  sql_table_name: analytics.attribution_summary ;;

  dimension: analytics_code {
    type: string
    sql: ${TABLE}.analytics_code ;;
  }

  dimension: call_source_name {
    type: string
    sql: ${TABLE}.call_source_name ;;
  }

  dimension_group: call_started_pst {
    convert_tz: no
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.call_started_pst ;;
  }

  dimension: call_utm_campaign {
    type: string
    sql: ${TABLE}.call_utm_campaign ;;
  }

  dimension: call_utm_medium {
    type: string
    sql: ${TABLE}.call_utm_medium ;;
  }

  dimension: call_utm_source {
    type: string
    sql: ${TABLE}.call_utm_source ;;
  }

  dimension_group: client_created_pst {
    convert_tz: no
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      day_of_month
    ]
    sql: ${TABLE}.client_created_pst ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension_group: first_appt_created_pst {
    convert_tz: no
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.first_appt_created_pst ;;
  }

  dimension: first_touch_channel {
    type: string
    sql: ${TABLE}.first_touch_channel ;;
  }

  dimension: first_touch_channel_type {
    type: string
    sql: case when lower(${TABLE}.first_touch_channel) ilike 'paid%' or lower(${TABLE}.first_touch_channel) in ('yelp', 'slm', 'acquisition', 'referral', 'offline', 'nextdoor') then 'Paid'
            else 'Organic'
         end;;
  }

  dimension: last_touch_channel {
    type: string
    sql: ${TABLE}.last_touch_channel ;;
  }

  dimension: last_touch_channel_type {
    type: string
    sql: case when lower(${TABLE}.last_touch_channel) ilike 'paid%' or lower(${TABLE}.last_touch_channel) in ('yelp', 'slm', 'acquisition', 'referral', 'offline', 'nextdoor') then 'Paid'
            else 'Organic'
         end;;
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}.phone_number ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: home_service_area {
    type: string
    sql: ${TABLE}.home_service_area ;;
  }

  dimension_group: server_received_pst {
    convert_tz: no
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.server_received_pst ;;
  }

  dimension: up_email {
    type: string
    sql: ${TABLE}.up_email ;;
  }

  dimension: up_initial_referrer {
    type: string
    sql: ${TABLE}.up_initial_referrer ;;
  }

  dimension: up_initial_utm_campaign {
    type: string
    sql: ${TABLE}.up_initial_utm_campaign ;;
  }

  dimension: up_initial_utm_content {
    type: string
    sql: ${TABLE}.up_initial_utm_content ;;
  }

  dimension: up_initial_utm_medium {
    type: string
    sql: ${TABLE}.up_initial_utm_medium ;;
  }

  dimension: up_initial_utm_source {
    type: string
    sql: ${TABLE}.up_initial_utm_source ;;
  }

  dimension: up_referrer {
    type: string
    sql: ${TABLE}.up_referrer ;;
  }

  dimension: up_utm_campaign {
    type: string
    sql: ${TABLE}.up_utm_campaign ;;
  }

  dimension: up_utm_content {
    type: string
    sql: ${TABLE}.up_utm_content ;;
  }

  dimension: up_utm_medium {
    type: string
    sql: ${TABLE}.up_utm_medium ;;
  }

  dimension: up_utm_source {
    type: string
    sql: ${TABLE}.up_utm_source ;;
  }

  dimension: zip_code {
    type: zipcode
    sql: ${TABLE}.zip_code ;;
  }

  measure: distinct_clients {
    type: count_distinct
    sql: ${client_id} ;;
  }
}
