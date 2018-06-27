view: combined_ad_performance_reports {
  derived_table: {
    datagroup_trigger: adwords_datagroup
    sql: select date_start, date_stop, uuid_ts, received_at, ad_id, adwords_customer_id, uuid, average_cost, average_position, average_time_on_site, bounce_rate, clicks, conversions, cost, impressions, 'vetted' as company
      from adwords.ad_performance_reports
      union all
      select date_start, date_stop, uuid_ts, received_at, ad_id, adwords_customer_id, uuid, average_cost, average_position, average_time_on_site, bounce_rate, clicks, conversions, cost, impressions, 'vetpronto' as company
      from vetprontoadwords.ad_performance_reports
       ;;
      distribution_style: all
  }

 dimension: id {
  primary_key: yes
  type: string
  sql: ${TABLE}.id ;;
}

dimension: ad_id {
  type: string
  # hidden: yes
  sql: ${TABLE}.ad_id ;;
}

dimension: adwords_customer_id {
  type: string
  sql: ${TABLE}.adwords_customer_id ;;
  hidden: yes
}

dimension: uuid {
  type: number
  value_format_name: id
  sql: ${TABLE}.uuid ;;
  hidden: yes
}

measure: count {
  type: count
  drill_fields: [details*]
}

##### Time Dimensions #####

dimension_group: date_start {
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
  convert_tz: no
}

dimension_group: date_stop {
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
  convert_tz: no
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
  drill_fields: [details*]
}

dimension: average_position {
  type: number
  sql: ${TABLE}.average_position ;;
  hidden: yes
}

measure: average_daily_ad_position {
  type: average
  sql: ${average_position} ;;
  value_format_name: decimal_2
  description: "Your ad's position relative to those of other advertisers."
  drill_fields: [details*]
}

dimension: average_time_on_site {
  type: number
  sql: ${TABLE}.average_time_on_site ;;
  hidden: yes
}

measure: average_daily_time_on_site {
  type: average
  hidden: yes
  description: "Total duration of all sessions (in seconds) / number of sessions, by day."
  sql: ${average_time_on_site} ;;
  drill_fields: [details*]
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
  hidden: yes
  description: "Percentage of clicks where the user only visited a single page on your site."
  sql: ${bounce_rate} ;;
  drill_fields: [details*]
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
  drill_fields: [details*]
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
  drill_fields: [details*]
}

dimension: cost_per_click {
  type: number
  sql: ${cost}/(NULLIF(${clicks},0)) ;;
}

measure: average_cost_per_conversion {
  type: number
  sql: ${total_cost}*1.0 / NULLIF(${total_conversions},0) ;;
  value_format_name: usd
  drill_fields: [details*]
}

dimension: cost {
  type: number
  sql: ${TABLE}.cost/1000000;;
  value_format_name: usd
  hidden: yes
}

measure: total_cost {
  type: sum
  description: "The sum of your cost-per-click (CPC) and cost-per-thousand impressions (CPM) costs during this period."
  sql: ${cost} ;;
  value_format_name: usd
  drill_fields: [details*]
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
  drill_fields: [details*]
}

set: details {
  fields: [ad_id,combinded_ad_groups.name, ad_campasigns.name, cost, cost_per_click, total_impressions, total_clicks, total_conversions]
  }

}
