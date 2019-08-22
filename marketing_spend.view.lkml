view: marketing_spend {
  derived_table: {
    sql: select * from (
          SELECT fb.date_start, sum(fb.spend) as "facebook_spend"
          FROM insights fb
          group by fb.date_start
          ) as a
      JOIN (
          SELECT aw.date_start as AWstart, sum(aw.cost)/1000000 as "adwords_spend"
          FROM campaign_performance_reports aw
          group by aw.date_start
          ) as ab ON a.date_start = ab.AWstart
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: date_start {
    type: time
    sql: ${TABLE}.date_start ;;
  }

  dimension: facebook_spend {
    type: number
    value_format_name: usd
    sql: ${TABLE}.facebook_spend ;;
  }

  dimension_group: awstart {
    type: time
    sql: ${TABLE}.awstart ;;
  }

  dimension: adwords_spend {
    type: number
    value_format_name: usd
    sql: ${TABLE}.adwords_spend ;;
  }

  set: detail {
    fields: [date_start_time, facebook_spend, awstart_time, adwords_spend]
  }
}
