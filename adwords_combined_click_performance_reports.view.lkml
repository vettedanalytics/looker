view: adwords_combined_click_performance_reports {
  derived_table: {
    sql: select ad_format, ad_group_id, ad_network_type_1, ad_network_type_2, adwords_customer_id, aoi_most_specific_target_id, campaign_id, click_type, creative_id, criteria_parameters, date_start, date_stop, device, gcl_id, id, page, received_at, slot, user_list_id, uuid, uuid_ts, 'vetted' as company
      from adwords.click_performance_reports
      union all
      select ad_format, ad_group_id, ad_network_type_1, ad_network_type_2, adwords_customer_id, aoi_most_specific_target_id, campaign_id, click_type, creative_id, criteria_parameters, date_start, date_stop, device, gcl_id, id, page, received_at, slot, user_list_id, uuid, uuid_ts, 'vetpronto' as company
      from vetprontoadwords.click_performance_reports
      limit 10
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: ad_format {
    type: string
    sql: ${TABLE}.ad_format ;;
  }

  dimension: ad_group_id {
    type: string
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: ad_network_type_1 {
    type: string
    sql: ${TABLE}.ad_network_type_1 ;;
  }

  dimension: ad_network_type_2 {
    type: string
    sql: ${TABLE}.ad_network_type_2 ;;
  }

  dimension: adwords_customer_id {
    type: string
    sql: ${TABLE}.adwords_customer_id ;;
  }

  dimension: aoi_most_specific_target_id {
    type: string
    sql: ${TABLE}.aoi_most_specific_target_id ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: click_type {
    type: string
    sql: ${TABLE}.click_type ;;
  }

  dimension: creative_id {
    type: string
    sql: ${TABLE}.creative_id ;;
  }

  dimension: criteria_parameters {
    type: string
    sql: ${TABLE}.criteria_parameters ;;
  }

  dimension_group: date_start {
    type: time
    sql: ${TABLE}.date_start ;;
  }

  dimension_group: date_stop {
    type: time
    sql: ${TABLE}.date_stop ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: gcl_id {
    type: string
    sql: ${TABLE}.gcl_id ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: page {
    type: number
    sql: ${TABLE}.page ;;
  }

  dimension_group: received_at {
    type: time
    sql: ${TABLE}.received_at ;;
  }

  dimension: slot {
    type: string
    sql: ${TABLE}.slot ;;
  }

  dimension: user_list_id {
    type: string
    sql: ${TABLE}.user_list_id ;;
  }

  dimension: uuid {
    type: number
    sql: ${TABLE}.uuid ;;
  }

  dimension_group: uuid_ts {
    type: time
    sql: ${TABLE}.uuid_ts ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  set: detail {
    fields: [
      ad_format,
      ad_group_id,
      ad_network_type_1,
      ad_network_type_2,
      adwords_customer_id,
      aoi_most_specific_target_id,
      campaign_id,
      click_type,
      creative_id,
      criteria_parameters,
      date_start_time,
      date_stop_time,
      device,
      gcl_id,
      id,
      page,
      received_at_time,
      slot,
      user_list_id,
      uuid,
      uuid_ts_time,
      company
    ]
  }
}
