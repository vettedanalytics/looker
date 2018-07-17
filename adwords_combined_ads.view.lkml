view: combined_ads {
  derived_table: {
    datagroup_trigger: adwords_datagroup
    sql: select id, ad_group_id, adwords_customer_id, original_id, received_at, status, type, uuid, uuid_ts, 'vetted' as company
      from adwords.ads
      union all
      select id, ad_group_id, adwords_customer_id, original_id, received_at, status, type, uuid, uuid_ts, 'vetpronto' as company
      from vetprontoadwords.ads
       ;;
    distribution_style: all
  }

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: ad_group_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.ad_group_id ;;
    hidden: yes
  }

  dimension: adwords_customer_id {
    type: string
    sql: ${TABLE}.adwords_customer_id ;;
    hidden: yes
  }

  dimension: original_id {
    type: string
    sql: ${TABLE}.original_id ;;
    hidden: yes
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

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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
    drill_fields: [id, combined_ad_groups.id, combined_ad_groups.name, combined_ad_performance_reports.count]
  }
}
