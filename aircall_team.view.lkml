view: aircall_team {
  sql_table_name: raw_data.aircall_team ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: direct_link {
    type: string
    sql: ${TABLE}.direct_link ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: users {
    type: string
    sql: ${TABLE}.users ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
