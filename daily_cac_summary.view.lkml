view: daily_cac_summary {
  sql_table_name: analytics.daily_cac_summary ;;

  dimension: channel_spend {
    type: string
    sql: ${TABLE}.channel_spend ;;
  }

  dimension: daily_spend {
    type: number
    sql: ${TABLE}.daily_spend ;;
  }

  dimension_group: date {
    group_label: "Client Created Date (PST)"
    label: "Client Created"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: last_touch_channel {
    type: string
    sql: ${TABLE}.last_touch_channel ;;
  }

  dimension: new_users {
    type: number
    sql: ${TABLE}.new_users ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  measure: cnt_of_new_users {
    type: sum
    sql: ${TABLE}.new_users ;;
  }

  measure: sum_of_daily_spend {
    type: sum
    sql: ${TABLE}.daily_spend ;;
  }
}
