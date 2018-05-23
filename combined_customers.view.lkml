view: combined_customers {
  derived_table: {
    sql_trigger_value: SELECT COUNT(*) FROM stripe_vetpronto.customers ;;
    sql: select id, created, 'vetted' as company
      from stripe_vetted.customers
      union all
      select id, created, 'vetpronto' as company
      from stripe_vetpronto.customers
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    sql: ${TABLE}.created ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  set: detail {
    fields: [id, created_time, company]
  }
}
