view: combined_cards {
  derived_table: {
    datagroup_trigger: ryan_test_default_datagroup
    sql: select address_zip, customer_id, name, 'vetpronto' as company, id
      from stripe_vetpronto.cards
      union all
      select address_zip, customer_id, name, 'vetted' as company, id
      from stripe_vetted.cards
       ;;
    distribution_style: all
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: address_zip {
    type: string
    sql: ${TABLE}.address_zip ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  set: detail {
    fields: [address_zip, customer_id, name, company, id]
  }
}
