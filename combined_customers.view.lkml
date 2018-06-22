view: combined_customers {
  derived_table: {
    datagroup_trigger: ryan_test_default_datagroup
    sql: select id, created, 'vetted' as company
      from stripe_vetted.customers
      union all
      select id, created, 'vetpronto' as company
      from stripe_vetpronto.customers
 ;;
    distribution_style: all
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
