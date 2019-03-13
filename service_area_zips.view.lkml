  view: service_area_zips {
    derived_table: {
      sql: SELECT
          TRIM(UNNEST(zip_codes) as zip_code
          , name as name
          , building as building
          , active as active
        ;;
    }

    dimension: id {
      primary_key: yes
      type: number
      sql: ${TABLE}.id ;;
    }

    dimension: name {
      type: string
      sql: ${TABLE}.name ;;
    }

    dimension: active {
      type: yesno
      sql: ${TABLE}.active ;;
    }

    dimension: building {
      type: yesno
      sql: ${TABLE}.building ;;
    }

    dimension: zip_code {
      type: zipcode
      sql: ${TABLE}.zip_code ;;
    }

    measure: count {
      hidden:  yes
      type: count
      drill_fields: [id, name]
    }
  }
