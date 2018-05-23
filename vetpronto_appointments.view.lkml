view: vetpronto_appointments {
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

  dimension_group: _sdc_batched {
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
    sql: ${TABLE}._sdc_batched_at ;;
  }

  dimension_group: _sdc_received {
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
    sql: ${TABLE}._sdc_received_at ;;
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: admin_booked {
    type: yesno
    sql: ${TABLE}.admin_booked ;;
  }

  dimension_group: annual_exam_reminder_sent {
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
    sql: ${TABLE}.annual_exam_reminder_sent ;;
  }

  dimension: bad_experience {
    type: yesno
    sql: ${TABLE}.bad_experience ;;
  }

  dimension: calendar_id {
    type: string
    sql: ${TABLE}.calendar_id ;;
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

  dimension: parking_tips {
    type: string
    sql: ${TABLE}.parking_tips ;;
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

  dimension_group: reminder_sent {
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
    sql: ${TABLE}.reminder_sent ;;
  }

  dimension_group: review_request_sent {
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
    sql: ${TABLE}.review_request_sent ;;
  }

  dimension: secondary_id {
    type: number
    sql: ${TABLE}.secondary_id ;;
  }

  dimension: service_area_id {
    type: number
    sql: ${TABLE}.service_area_id ;;
  }

  dimension_group: snoozed_until {
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
    sql: ${TABLE}.snoozed_until ;;
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
      year
    ]
    sql: ${TABLE}.start_time ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: upcoming_reminder_sent {
    type: yesno
    sql: ${TABLE}.upcoming_reminder_sent ;;
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

  dimension: vet_comments {
    type: string
    sql: ${TABLE}.vet_comments ;;
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
