view: aircall_number {
  sql_table_name: raw_data.aircall_number ;;
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

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: digits {
    type: string
    sql: ${TABLE}.digits ;;
  }

  dimension: direct_link {
    type: string
    sql: ${TABLE}.direct_link ;;
  }

  dimension: is_ivr {
    type: yesno
    sql: ${TABLE}.is_ivr ;;
  }

  dimension: live_recording_activated {
    type: yesno
    sql: ${TABLE}.live_recording_activated ;;
  }

  dimension: messages {
    type: string
    sql: ${TABLE}.messages ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: open {
    type: yesno
    sql: ${TABLE}.open ;;
  }

  dimension: time_zone {
    type: string
    sql: ${TABLE}.time_zone ;;
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
