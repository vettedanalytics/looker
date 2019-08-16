view: appointments {
  sql_table_name: postgres_database.appointments ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: address {
    hidden: yes
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: admin_booked {
    type: yesno
    sql: ${TABLE}.admin_booked ;;
  }

  dimension: category {
    hidden: yes
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: city {
    hidden: yes
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
      year,
      day_of_week,
      day_of_month
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: discount_code {
    hidden: yes
    type: string
    sql: ${TABLE}.discount_code ;;
  }

  dimension_group: end {
    hidden: yes
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
    hidden: yes
    type: string
    sql: ${TABLE}.phone_number ;;
  }

  dimension: price {
    hidden: yes
    type: string
    sql: ${TABLE}.price ;;
  }

  dimension: promo_code_id {
    hidden: yes
    type: number
    sql: ${TABLE}.promo_code_id ;;
  }

  dimension: quick_booked {
    hidden: yes
    type: yesno
    sql: ${TABLE}.quick_booked ;;
  }

  dimension: secondary_id {
    hidden: yes
    type: number
    sql: ${TABLE}.secondary_id ;;
  }

  dimension: service_area_id {
    hidden: yes
    type: number
    sql: ${TABLE}.service_area_id ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      day_of_week,
      hour,
      hour_of_day,
      day_of_month
    ]
    sql: ${TABLE}.start_time ;;
  }

  dimension: state {
    hidden: yes
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: upcoming_reminder_sent {
    hidden: yes
    type: yesno
    sql: ${TABLE}.upcoming_reminder_sent ;;
  }

  dimension: vet_id {
    hidden: yes
    type: number
    sql: ${TABLE}.vet_id ;;
  }

  dimension: working {
    hidden: yes
    type: yesno
    sql: ${TABLE}.working ;;
  }

  dimension: zip_code {
    type: zipcode
    sql: ${TABLE}.zip_code ;;
  }

  dimension: is_first_appointment {
    type:  yesno
    sql: ${client_faq.first_appointment_time} = ${start_time};;
  }

  measure: count {
    label: "Count of Appointments"
    type: count
    drill_fields: [id, client_id]
  }

  measure: confirmed_appointments {
    type: count_distinct
    filters: {
      field: confirmed
      value: "yes"
    }
    sql: ${id} ;;
    drill_fields: [id, client_id]
  }

  measure: admin_appointments {
    type: count_distinct
    filters: {
      field: admin_booked
      value: "yes"
    }
    sql: ${id} ;;
  }

  measure: first_appointment {
    hidden: yes
    type:  min
    sql: ${start_raw} ;;

  }

  measure: last_appointment {
    hidden:  yes
    type:  max
    sql: ${start_raw} ;;
  }

  measure: first_time_appointments {
    type:  count
    filters: {
      field: is_first_appointment
      value: "yes"
    }
  }

  measure: repeat_appointments {
    type:  count
    filters: {
      field: is_first_appointment
      value: "no"
    }
  }

  measure: running_total_appointments {
    type:  running_total
    sql: ${count} ;;
  }
  measure: distinct_clients {
    type: count_distinct
    sql: ${client_id} ;;
  }
}
