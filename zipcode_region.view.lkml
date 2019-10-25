view: zipcode_region {
  derived_table: {
    sql:select distinct zipcode, region
        from (
          select distinct c.zip_code as zipcode, name, region as service_area, get_region(service_area) as region
          from raw_data.clients c
          left join raw_data.service_areas s on s.zip_codes like concat(concat('%', c.zip_code), '%')
          where active=true and building=false and zip_code <> '0'
        );;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: region {
    type: string
    sql: case when ${TABLE}.region is null then 'UNKNOWN' else ${TABLE}.region end;;
  }

  # This hard-coded dimension needs to be updated if there is any change on data.

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}.zipcode ;;
  }

  set: detail {
    fields: [zipcode]
  }
}
