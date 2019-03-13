view: service_area_zips {
  derived_table: {
    sql: select name, building, TRIM(UNNEST(zip_codes)) from service_areas
      where building=false
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: building {
    type: string
    sql: ${TABLE}.building ;;
  }

  dimension: btrim {
    type: zipcode
    sql: ${TABLE}.btrim ;;
  }

  set: detail {
    fields: [name, building, btrim]
  }
}
