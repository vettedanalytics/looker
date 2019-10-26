view: daily_cac_first_touch_channel {
  derived_table: {
    sql: select coalesce(a.date, b.date) as date,
               coalesce(a.region, b.region) as region,
               coalesce(a.first_touch_channel, b.renamed_channel) as channel,
               isnull(new_users, 0) as new_users,
               isnull(daily_spend, 0) as daily_spend
          from (
          select date(client_created_pst) date, region, first_touch_channel, count(distinct client_id) as new_users
          from analytics.attribution_summary
          group by 1,2,3
          ) a
          full outer join (
          select date, region, renamed_channel, daily_spend
          from analytics.daily_spend_summary
          ) b on a.date = b.date and a.region = b.region and a.first_touch_channel = b.renamed_channel
          order by 1
 ;;
  }

  dimension_group: date {
    group_label: "Client Created Date (PST)"
    label: "Client Created"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    #convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: channel {
    description: "First Touch Channel"
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: channel_type {
    type: string
    sql: case when lower(${TABLE}.channel) ilike 'paid%' or lower(${TABLE}.channel) in ('yelp', 'experimental', 'slm', 'acquisition', 'referral', 'offline', 'nextdoor') then 'Paid'
            else 'Organic'
         end;;
  }

  dimension: new_users {
    label: "Daily New Users"
    type: number
    sql: ${TABLE}.new_users ;;
  }

  dimension: daily_spend {
    type: number
    sql: ${TABLE}.daily_spend ;;
  }

  measure: sum_of_daily_new_users {
    label: "Count of New Users"
    type: sum
    sql: ${TABLE}.new_users ;;
    drill_fields: [detail*]
  }

  measure: sum_of_daily_spend {
    label: "Total Marketing Spend"
    type: sum
    sql: ${TABLE}.daily_spend ;;
    drill_fields: [detail*]
  }

  set: detail {
    fields: []
  }
}
