view: marketing_spent {
  sql_table_name: raw_data.marketing_spent ;;

  dimension: area {
    type: string
    sql: ${TABLE}.area ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: spent {
    type: number
    sql: ${TABLE}.spent ;;
  }

  dimension: year_month {
    type: string
    sql: ${TABLE}.year_month ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
