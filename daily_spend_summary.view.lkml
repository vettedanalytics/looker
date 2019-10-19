view: daily_spend_summary {
  sql_table_name: analytics.daily_spend_summary ;;

  dimension: area {
    type: string
    sql: ${TABLE}.area ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: daily_spend {
    type: number
    sql: ${TABLE}.daily_spend ;;
  }

  dimension_group: date_start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
   # convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: renamed_channel {
    description: "This can be linked with Last touch channel (or First touch channel) in the Marketing Attribution explorer"
    type: string
    sql: ${TABLE}.renamed_channel ;;
  }

  measure: sum_of_daily_spend {
    type: sum
    sql: ${TABLE}.daily_spend ;;
  }
}
