view: aircall_contact {
  sql_table_name: raw_data.aircall_contact ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: direct_link {
    type: string
    sql: ${TABLE}.direct_link ;;
  }

  dimension: emails {
    type: string
    sql: ${TABLE}.emails ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: information {
    type: string
    sql: ${TABLE}.information ;;
  }

  dimension: is_shared {
    type: yesno
    sql: ${TABLE}.is_shared ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: phone_numbers {
    type: string
    sql: ${TABLE}.phone_numbers ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: urls {
    type: string
    sql: ${TABLE}.urls ;;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name, company_name]
  }
}
