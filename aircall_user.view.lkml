view: aircall_user {
  sql_table_name: raw_data.aircall_user ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: availability_status {
    type: string
    sql: ${TABLE}.availability_status ;;
  }

  dimension: available {
    type: yesno
    sql: ${TABLE}.available ;;
  }

  dimension: direct_link {
    type: string
    sql: ${TABLE}.direct_link ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: numbers {
    type: string
    sql: ${TABLE}.numbers ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
