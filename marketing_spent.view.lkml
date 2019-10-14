view: marketing_spent {
  sql_table_name: raw_data.marketing_spent ;;

  dimension: acquisition {
    type: number
    sql: ${TABLE}.acquisition ;;
  }

  dimension: adwords {
    type: number
    sql: ${TABLE}.adwords ;;
  }

  dimension: area {
    type: string
    sql: ${TABLE}.area ;;
  }

  dimension: bing {
    type: number
    sql: ${TABLE}.bing ;;
  }

  dimension: door_hangers {
    type: number
    sql: ${TABLE}.door_hangers ;;
  }

  dimension: events {
    type: number
    sql: ${TABLE}.events ;;
  }

  dimension: experimental {
    type: number
    sql: ${TABLE}.experimental ;;
  }

  dimension: facebook {
    type: number
    sql: ${TABLE}.facebook ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: slm {
    type: number
    sql: ${TABLE}.slm ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  dimension: year_month {
    type: string
    sql: ${TABLE}.year_month ;;
  }

  dimension: yelp {
    type: number
    sql: ${TABLE}.yelp ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
