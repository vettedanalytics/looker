view: combined_ad_groups {
  derived_table: {
    datagroup_trigger: adwords_datagroup
    sql: select id, adwords_customer_id, campaign_id, name, received_at, status, uuid, uuid_ts, 'vetted' as company
      from adwords.ad_groups
      union all
      select id, adwords_customer_id, campaign_id, name, received_at, status, uuid, uuid_ts, 'vetpronto' as company
      from vetprontoadwords.ad_groups
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
    sql: ${TABLE}.adwords_customer_id ;;
    hidden: yes
  }

  dimension: campaign_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.campaign_id ;;
    hidden: yes
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
    sql: ${TABLE}.received_at ;;
    hidden: yes
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    hidden: yes
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      campaigns.id,
      campaigns.name,
      combined_ads.count,
      click_performance_reports.count
    ]
  }
}
