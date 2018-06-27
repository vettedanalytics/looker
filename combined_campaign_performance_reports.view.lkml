view: combined_campaign_performance_reports {
  derived_table: {
    sql: select id, adwords_customer_id, base_campaign_id, budget_id, campaign_id, campaign_status, uuid, date_start, date_stop, received_at, uuid_ts, impression_reach, invalid_clicks, is_budget_explicitly_shared, all_conversion_rate, all_conversion_value, all_conversions, value_per_all_conversion, average_cost, average_position, bounce_rate, clicks, conversion_value, conversions, cost, impressions, 'vetted' as company
      from adwords.campaign_performance_reports
      union all
      select id, adwords_customer_id, base_campaign_id, budget_id, campaign_id, campaign_status, uuid, date_start, date_stop, received_at, uuid_ts, impression_reach, invalid_clicks, is_budget_explicitly_shared, all_conversion_rate, all_conversion_value, all_conversions, value_per_all_conversion, average_cost, average_position, bounce_rate, clicks, conversion_value, conversions, cost, impressions, 'vetpronto' as company
      from vetprontoadwords.campaign_performance_reports
       ;;
  }

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  filter: campaign_select {
    suggest_dimension: combined_campaigns.name
  }

  dimension: campaign_comparitor {
    type: string
    sql: CASE WHEN {% condition campaign_select %} ${combined_campaigns.name} {% endcondition %}
      THEN ${combined_campaigns.name}
      ELSE 'Rest Of Population'
      END ;;
  }

  dimension: adwords_customer_id {
    type: string
    sql: ${TABLE}.adwords_customer_id ;;
    hidden: yes
  }

  dimension: base_campaign_id {
    type: string
    sql: ${TABLE}.base_campaign_id ;;
    hidden: yes
  }

  dimension: budget_id {
    type: string
    sql: ${TABLE}.budget_id ;;
    hidden: yes
  }

  dimension: campaign_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }

  measure: total_campaigns {
    type: count_distinct
    sql: ${campaign_id} ;;
    drill_fields: [campaigns.name, total_cost]
  }

  dimension: uuid {
    type: number
    value_format_name: id
    sql: ${TABLE}.uuid ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: [id, campaigns.id, campaigns.name]
  }

##### Time Dimensions #####

  dimension_group: start {
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
    sql: ${TABLE}.date_start ;;
  }

  dimension_group: stop {
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
    hidden: yes
    sql: ${TABLE}.date_stop ;;
  }

  dimension_group: received {
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
    sql: ${TABLE}.received_at ;;
    hidden: yes
  }

  dimension_group: uuid_ts {
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
    sql: ${TABLE}.uuid_ts ;;
    hidden: yes
  }


##### Campaign-Specific Metrics #####

  dimension: is_active_campaign {
    type: yesno
    sql: ${TABLE}.campaign_status = 'Status_Active' ;;
  }

  dimension: impression_reach {
    type: string
    description: "Number of unique cookies that were exposed to your ad over a given time period, or the special value < 100 if the number of cookies is less than 100."
    hidden: yes
    #only value in table is '--'
    sql: ${TABLE}.impression_reach ;;
  }

  dimension: invalid_clicks {
    type: number
    sql: ${TABLE}.invalid_clicks ;;
    hidden: yes
  }

  measure: total_invalid_clicks {
    type: sum
    sql: ${invalid_clicks} ;;
    description: "Number of clicks Google considers illegitimate and doesn't charge you for."
  }

  dimension: is_budget_explicitly_shared {
    type: yesno
    hidden: yes
    sql: ${TABLE}.is_budget_explicitly_shared = 'true' ;;
  }

##### All Conversions #####

##### (Best estimate of the total number of conversions that AdWords drives.
##### Includes website, cross-device, and phone call conversions.

  dimension: all_conversion_rate {
    type: number
    sql: ${TABLE}.all_conversion_rate ;;
    value_format_name: percent_2
    hidden: yes
  }

  measure: average_daily_all_conversion_rate {
    type: average
    sql: ${all_conversion_rate} ;;
    value_format_name: percent_2
    hidden: yes
    description: "All Conversions divided by total clicks that can be conversion-tracked. Note: this is a best estimate performed by Google."
  }

  dimension: all_conversion_value {
    type: number
    sql: ${TABLE}.all_conversion_value ;;
    hidden: yes
  }

  measure: total_all_conversion_value {
    type: sum
    sql: ${all_conversion_value} ;;
    description: "The total value of all of your conversions, including those that are estimated. Note: this is a best estimate performed by Google."
    hidden: yes
  }

  dimension: all_conversions {
    type: number
    sql: ${TABLE}.all_conversions ;;
    hidden: yes
  }

  measure: total_all_conversions {
    type: sum
    sql: ${all_conversions} ;;
    description: "Best estimate of the total number of conversions that AdWords drives. Includes website, cross-device, and phone call conversions. Note: this is a best estimate performed by Google."
  }

  dimension: value_per_all_conversion {
    type: number
    sql: ${TABLE}.value_per_all_conversion ;;
    hidden: yes
  }

  measure: average_daily_value_per_all_conversion {
    description: "The value, on average, of all conversions. "
    type: average
    hidden: yes
    sql: ${value_per_all_conversion} ;;
  }

##### Standard Metrics #####

  dimension: average_cost {
    type: number
    sql: ${TABLE}.average_cost/1000000 ;;
    hidden: yes
  }

  measure: average_daily_cost {
    description: "The average amount you pay per interaction. This amount is the total cost of your ads divided by the total number of interactions."
    type: average
    value_format_name: usd
    sql: ${average_cost} ;;
  }

  dimension: average_position {
    type: number
    sql: ${TABLE}.average_position ;;
    value_format_name: decimal_2
    hidden: yes
  }

  measure: average_daily_ad_position {
    type: average
    sql: ${average_position} ;;
    value_format_name: decimal_2
    description: "Your ad's position relative to those of other advertisers."
  }

  dimension: average_time_on_site {
    type: number
    sql: ${TABLE}.average_time_on_site ;;
    hidden: yes
  }

  measure: average_daily_time_on_site {
    type: average
    description: "Total duration of all sessions (in seconds) / number of sessions, by day."
    sql: ${average_time_on_site} ;;
    hidden: yes
  }

  dimension: bounce_rate {
    type: number
    sql: ${TABLE}.bounce_rate ;;
    value_format_name: percent_2
    hidden: yes
  }

  measure: average_daily_bounce_rate {
    type: average
    value_format_name: percent_2
    description: "Percentage of clicks where the user only visited a single page on your site."
    sql: ${bounce_rate} ;;
    hidden: yes
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
    hidden: yes
  }

  measure: total_clicks {
    type: sum
    sql: ${clicks} ;;
    description: "The number of clicks."
    drill_fields: [start_date, total_impressions,total_clicks,total_conversions, total_cost]
  }

  dimension: conversion_value {
    type: number
    sql: ${TABLE}.conversion_value ;;
    hidden: yes
  }

  measure: average_daily_conversion_value {
    type: average
    sql: ${conversion_value} ;;
    hidden: yes
    description: "The sum of conversion values for all conversions."
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
    hidden: yes
  }

  measure: total_conversions {
    type: sum
    description: "The number of conversions for all conversion actions that you have opted into optimization."
    sql: ${conversions} ;;
    drill_fields: [start_date, total_conversions, total_cost]
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost/1000000 ;;
    value_format_name: usd
    hidden: yes
  }

  measure: total_cost {
    type: sum
    description: "The sum of your cost-per-click (CPC) and cost-per-thousand impressions (CPM) costs during this period."
    sql: ${cost} ;;
    value_format_name: usd
    drill_fields: [start_date, campaigns.name, total_cost]
  }

  measure: average_cost_per_conversion {
    type: number
    sql: ${total_cost}*1.0 / NULLIF(${total_conversions},0) ;;
    value_format_name: usd
    drill_fields: [start_date, campaigns.name, total_cost]
  }

  measure: average_conversion_rate {
    type: number
    sql: ${total_conversions}*1.0 / NULLIF(${total_clicks},0) ;;
    value_format_name: percent_2
    drill_fields: [start_date,average_conversion_rate]
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
    hidden: yes
  }

  measure: total_impressions {
    type: sum
    description: "Count of how often your ad has appeared on a search results page or website on the Google Network."
    sql: ${impressions} ;;
    drill_fields: [start_date, total_impressions, total_clicks,total_conversions, total_cost]
  }
}
