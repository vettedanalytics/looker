view: segment_vetted_user_source_facts {
  derived_table: {
    sql: with tracks_lvi as (
      select t.*, a.looker_visitor_id
      from javascript.tracks t
      join ${segment_vetted_alias_mapping.SQL_TABLE_NAME} a on t.anonymous_id = a.alias
      ),
      looker_visitor_attribution as(
      select looker_visitor_id, min(timestamp) as initial_source_date, max(timestamp) as last_source_date, count(distinct context_campaign_source || context_campaign_medium) as count_of_sources
      from tracks_lvi
      where context_campaign_source is not null or context_page_referrer is not null
      group by looker_visitor_id)

      select a.*, t.context_campaign_source as initial_source, t.context_campaign_medium as initial_medium, t.context_page_referrer as initial_referrer, t2.context_campaign_source as last_source, t2.context_campaign_medium as last_medium, t2.context_page_referrer as last_referrer
      from looker_visitor_attribution a
      join tracks_lvi t on a.looker_visitor_id = t.looker_visitor_id and a.initial_source_date = t.timestamp
      join tracks_lvi t2 on a.looker_visitor_id = t2.looker_visitor_id and a.last_source_date = t2.timestamp
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: looker_visitor_id {
    type: string
    sql: ${TABLE}.looker_visitor_id ;;
  }

  dimension_group: initial_source_date {
    type: time
    sql: ${TABLE}.initial_source_date ;;
  }

  dimension_group: last_source_date {
    type: time
    sql: ${TABLE}.last_source_date ;;
  }

  dimension: count_of_sources {
    type: number
    sql: ${TABLE}.count_of_sources ;;
  }

  dimension: initial_source {
    type: string
    sql: ${TABLE}.initial_source ;;
  }

  dimension: initial_medium {
    type: string
    sql: ${TABLE}.initial_medium ;;
  }

  dimension: initial_referrer{
    type:  string
    sql: ${TABLE}.initial_referrer ;;
  }

  dimension: last_source {
    type: string
    sql: ${TABLE}.last_source ;;
  }

  dimension: last_medium {
    type: string
    sql: ${TABLE}.last_medium ;;
  }

  dimension: last_referrer {
    type:  string
    sql: ${TABLE}.last_referrer ;;
  }

  dimension: initial_source_medium {
    label: "Initial Source/Medium"
    sql: ${initial_source} || ' | ' || ${initial_medium};;
  }

  dimension: initial_channel {
   label: "Marketing Channel"
    sql: case when ${initial_source_medium} is not null then ${initial_source_medium}
    when ${initial_referrer} is not null then ${initial_referrer}
    else 'Direct'
    end;;
  }

  set: detail {
    fields: [
      looker_visitor_id,
      initial_source_date_time,
      last_source_date_time,
      count_of_sources,
      initial_source,
      initial_medium,
      last_source,
      last_medium
    ]
  }
}
