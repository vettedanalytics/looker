view: vetted_visit {
  sql_table_name: vetted-q-3.visit ;;

  dimension: visit_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.VisitID ;;
  }

  dimension: admin_comments {
    type: string
    sql: ${TABLE}.AdminComments ;;
  }

  dimension: cancellation_reason {
    type: string
    sql: ${TABLE}.CancellationReason ;;
  }

  dimension: cancelled_flag {
    type: yesno
    sql: ${TABLE}.CancelledFlag ;;
  }

  dimension: cancelledby_id {
    type: number
    sql: ${TABLE}.CancelledbyID ;;
  }

  dimension: client_review {
    type: string
    sql: ${TABLE}.ClientReview ;;
  }

  dimension: completed_by_id {
    type: number
    sql: ${TABLE}.CompletedByID ;;
  }

  dimension: completed_flag {
    type: yesno
    sql: ${TABLE}.CompletedFlag ;;
  }

  dimension_group: created {
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

  dimension: cust_id {
    type: number
    sql: ${TABLE}.CustID ;;
  }

  dimension: cust_rating {
    type: number
    sql: ${TABLE}.CustRating ;;
  }

  dimension: customer_view_flag {
    type: yesno
    sql: ${TABLE}.CustomerViewFlag ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Date ;;
  }

  dimension: del_flag {
    type: number
    sql: ${TABLE}.DelFlag ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.EndTime ;;
  }

  dimension: original_visit_id {
    type: number
    sql: ${TABLE}.OriginalVisitID ;;
  }

  dimension: random_token {
    type: string
    sql: ${TABLE}.random_token ;;
  }

  dimension: reschedule_flag {
    type: number
    sql: ${TABLE}.RescheduleFlag ;;
  }

  dimension: rescheduleby_id {
    type: number
    sql: ${TABLE}.ReschedulebyID ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.StartTime ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }

  dimension: tzabbreviation {
    type: string
    sql: ${TABLE}.TZAbbreviation ;;
  }

  dimension_group: updated {
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

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }

  dimension: utm_medium {
    type: string
    sql: ${TABLE}.utm_medium ;;
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  dimension: vet_id {
    type: number
    sql: ${TABLE}.VetID ;;
  }

  dimension: vet_review {
    type: string
    sql: ${TABLE}.VetReview ;;
  }

  dimension: vet_tech_id {
    type: number
    sql: ${TABLE}.VetTechID ;;
  }

  dimension: vet_view_flag {
    type: yesno
    sql: ${TABLE}.VetViewFlag ;;
  }

  dimension_group: visit_ended {
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
    sql: ${TABLE}.VisitEndedAt ;;
  }

  dimension_group: visit_started {
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
    sql: ${TABLE}.VisitStartedAt ;;
  }

  dimension_group: visit_vet_on_way {
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
    sql: ${TABLE}.VisitVetOnWay ;;
  }

  measure: count {
    type: count
    drill_fields: [visit_id]
  }
}
