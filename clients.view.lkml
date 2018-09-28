view: clients {
  sql_table_name: postgres_database.clients ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    drill_fields: [full_name, first_name, last_name, phone_number, user_id]
  }

  dimension: analytics_id {
    hidden:  yes
    type: string
    sql: ${TABLE}.analytics_id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: chargebee_id {
    hidden:  yes
    type: string
    sql: ${TABLE}.chargebee_id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
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
    drill_fields: [full_name, first_name, user_id, combined_charges.customer_id]
  }

  dimension: do_not_email {
    hidden:  yes
    type: yesno
    sql: ${TABLE}.do_not_email ;;
  }

  dimension: first_name {
    hidden:  yes
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    hidden:  yes
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: notes {
    hidden:  yes
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: parking_tips {
    hidden:  yes
    type: string
    sql: ${TABLE}.parking_tips ;;
  }

  dimension: phone_number {
    hidden:  yes
    type: string
    sql: ${TABLE}.phone_number ;;
  }

  dimension: plan {
    hidden:  yes
    type: string
    sql: ${TABLE}.plan ;;
  }

  dimension: secondary_email {
    hidden:  yes
    type: string
    sql: ${TABLE}.secondary_email ;;
  }

  dimension: secondary_first_name {
    hidden:  yes
    type: string
    sql: ${TABLE}.secondary_first_name ;;
  }

  dimension: secondary_last_name {
    hidden:  yes
    type: string
    sql: ${TABLE}.secondary_last_name ;;
  }

  dimension: secondary_phone_number {
    hidden:  yes
    type: string
    sql: ${TABLE}.secondary_phone_number ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: street_address {
    hidden:  yes
    type: string
    sql: ${TABLE}.street_address ;;
  }

  dimension: stripe_token {
    hidden:  yes
    type: string
    sql: ${TABLE}.stripe_token ;;
  }

  dimension_group: updated {
    hidden:  yes
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

  dimension: user_id {
    hidden:  yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: zip_code {
    type: zipcode
    sql: ${TABLE}.zip_code ;;
  }

  measure: count {
    type: count
    drill_fields: [id, secondary_last_name, secondary_first_name, last_name, first_name, full_name]
  }

  dimension: full_name {
    type: string
    sql: (${first_name} || ' ' || ${last_name}) ;;
  }
}
