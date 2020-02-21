view: service_areas {
  sql_table_name: raw_data.service_areas ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: building {
    type: yesno
    sql: ${TABLE}.building ;;
  }

  dimension: building_city_state_zip {
    type: string
    sql: ${TABLE}.building_city_state_zip ;;
  }

  dimension: building_street_address {
    type: string
    sql: ${TABLE}.building_street_address ;;
  }

  dimension: building_zip {
    type: string
    sql: ${TABLE}.building_zip ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: on_site {
    type: yesno
    sql: ${TABLE}.on_site ;;
  }

  dimension: price_list {
    type: string
    sql: ${TABLE}.price_list ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: self_scheduled {
    hidden:  yes
    type: yesno
    sql: ${TABLE}.self_scheduled ;;
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
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

  dimension: zip_codes {
    type: string
    sql: ${TABLE}.zip_codes ;;
  }

 dimension: is_home {
    type:  string
    sql: case
  when ${id} in ('1','323','294','300') then 'Home'
  else 'Auxillary' ;;
}

  measure: count {
    hidden:  yes
    type: count
    drill_fields: [id, name]
  }
}
