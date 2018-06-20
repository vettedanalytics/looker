view: vets {
  sql_table_name: postgres_database.vets ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: appointment_cut_off {
    type: number
    sql: ${TABLE}.appointment_cut_off ;;
  }

  dimension: appointment_distance {
    type: number
    sql: ${TABLE}.appointment_distance ;;
  }

  dimension: appointment_duration {
    type: number
    sql: ${TABLE}.appointment_duration ;;
  }

  dimension: bio {
    type: string
    sql: ${TABLE}.bio ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
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

  dimension: dea_license_number {
    type: string
    sql: ${TABLE}.dea_license_number ;;
  }

  dimension: independent {
    type: yesno
    sql: ${TABLE}.independent ;;
  }

  dimension: is_vet {
    type: yesno
    sql: ${TABLE}.is_vet ;;
  }

  dimension: license_number {
    type: string
    sql: ${TABLE}.license_number ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}.phone_number ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photo_url ;;
  }

  dimension: rx_address {
    type: string
    sql: ${TABLE}.rx_address ;;
  }

  dimension: self_scheduled {
    type: yesno
    sql: ${TABLE}.self_scheduled ;;
  }

  dimension: service_area_id {
    type: number
    sql: ${TABLE}.service_area_id ;;
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

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: yelp_url {
    type: string
    sql: ${TABLE}.yelp_url ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, users.id]
  }
}
