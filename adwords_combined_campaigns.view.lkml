view: combined_campaigns {
  derived_table: {
    datagroup_trigger: adwords_datagroup
    sql: select id, adwords_customer_id, end_date, name, received_at, serving_status, start_date, status, uuid, uuid_ts, 'vetted' as company
      from adwords.campaigns
      union all
      select id, adwords_customer_id, end_date, name, received_at, serving_status, start_date, status, uuid, uuid_ts, 'vetpronto' as company
      from vetprontoadwords.campaigns
       ;;
    distribution_style: all
  }

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: adwords_customer_id {
    type: string
    hidden: yes
    sql: ${TABLE}.adwords_customer_id ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
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
    hidden: yes
    sql: ${TABLE}.received_at ;;
  }

  dimension: serving_status {
    hidden: yes
    type: string
    sql: ${TABLE}.serving_status ;;
  }

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
    sql: ${TABLE}.start_date ;;
  }

  dimension: campaign_duration_in_days {
    type: number
    sql: CASE WHEN current_date < ${end_date} THEN DATEDIFF('day',${start_raw}, current_date)
              ELSE DATEDIFF('day', ${start_raw}, ${end_raw})
         END;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: uuid {
    type: number
    value_format_name: id
    sql: ${TABLE}.uuid ;;
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

  measure: count {
    type: count
    drill_fields: [id, name, ad_groups.count, campaign_performance_reports.count, click_performance_reports.count]
  }
}
