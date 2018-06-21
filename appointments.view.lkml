view: appointments {
  sql_table_name: postgres_database.appointments ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  measure: confirmed_appointments {
    type: count_distinct
    filters: {
      field: confirmed
      value: "yes"
    }
    sql: ${id} ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: admin_booked {
    type: yesno
    sql: ${TABLE}.admin_booked ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: confirmed {
    type: yesno
    sql: ${TABLE}.confirmed ;;
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

  dimension: discount_code {
    type: string
    sql: ${TABLE}.discount_code ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_time ;;
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}.phone_number ;;
  }

  dimension: price {
    type: string
    sql: ${TABLE}.price ;;
  }

  dimension: promo_code_id {
    type: number
    sql: ${TABLE}.promo_code_id ;;
  }

  dimension: quick_booked {
    type: yesno
    sql: ${TABLE}.quick_booked ;;
  }

  dimension: secondary_id {
    type: number
    sql: ${TABLE}.secondary_id ;;
  }

  dimension: service_area_id {
    type: number
    sql: ${TABLE}.service_area_id ;;
  }

  dimension_group: start {
    type: time
    sql: ${TABLE}.start_time ;;
    convert_tz:  no
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: upcoming_reminder_sent {
    type: yesno
    sql: ${TABLE}.upcoming_reminder_sent ;;
  }

  dimension: vet_id {
    type: number
    sql: ${TABLE}.vet_id ;;
  }

  dimension: working {
    type: yesno
    sql: ${TABLE}.working ;;
  }

  dimension: zip_code {
    type: zipcode
    sql: ${TABLE}.zip_code ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
