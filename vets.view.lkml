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
    hidden: yes
  }

  dimension: appointment_distance {
    type: number
    sql: ${TABLE}.appointment_distance ;;
    hidden: yes
  }

  dimension: appointment_duration {
    type: number
    sql: ${TABLE}.appointment_duration ;;
    hidden: yes
  }

  dimension: bio {
    type: string
    sql: ${TABLE}.bio ;;
    hidden: yes
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
    hidden: yes
  }

  dimension: independent {
    type: yesno
    sql: ${TABLE}.independent ;;
    hidden: yes
  }

  dimension: is_vet {
    type: yesno
    sql: ${TABLE}.is_vet ;;
  }

  dimension: license_number {
    type: string
    sql: ${TABLE}.license_number ;;
    hidden: yes
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}.phone_number ;;
    hidden: yes
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photo_url ;;
    hidden: yes
  }

  dimension: rx_address {
    type: string
    sql: ${TABLE}.rx_address ;;
    hidden: yes
  }

  dimension: self_scheduled {
    type: yesno
    sql: ${TABLE}.self_scheduled ;;
    hidden: yes
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
    hidden: yes
  }

  dimension: yelp_url {
    type: string
    sql: ${TABLE}.yelp_url ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: [id, name, users.id]
  }

  measure: count_running_total {
    type: running_total
    sql: ${count} ;;
    drill_fields: [id, name, users.id]
  }
}
