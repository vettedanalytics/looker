view: combined_customers {
  derived_table: {
    datagroup_trigger: ryan_test_default_datagroup
    sql:
    select id, created, max(email) as email, company, description from (
      select id, created, email, 'vetted' as company, description
        from stripe_vetted.customers
      union
      select cust1.id, cust1.created as email, card1.name, 'vetted' as company, cust1.description
        from stripe_vetted.customers cust1  join stripe_vetted.cards card1  on cust1.id=card1.customer_id where card1.name like '%@%'
      union
      select id, created, email, 'vetpronto' as company, description
        from stripe_vetpronto.customers
      union
      select cust2.id, cust2.created, card2.name as email, 'vetpronto' as company, cust2.description
        from stripe_vetpronto.customers cust2 join stripe_vetpronto.cards card2 on cust2.id=card2.customer_id where card2.name like '%@%'
        ) as tab1
      group by   1,2,4,5
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

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension_group: created {
    type: time
    sql: ${TABLE}.created ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: chargebee_id {
    type:  string
    sql: REGEXP_REPLACE(${TABLE}.description, 'ChargeBee handle: ') ;;
  }

  set: detail {
    fields: [id, created_time, company]
  }
}
