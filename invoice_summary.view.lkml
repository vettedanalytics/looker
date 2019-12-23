view: invoice_summary {
  sql_table_name: analytics.invoice_summary ;;

  dimension: all_breed_names {
    type: string
    sql: ${TABLE}.all_breed_names ;;
  }

  dimension: all_category_amounts {
    type: string
    sql: ${TABLE}.all_category_amounts ;;
  }

  dimension: all_category_names {
    type: string
    sql: ${TABLE}.all_category_names ;;
  }

  dimension: all_category_patientids {
    type: string
    sql: ${TABLE}.all_category_patientids ;;
  }

  dimension: all_patient_ids {
    type: string
    sql: ${TABLE}.all_patient_ids ;;
  }

  dimension: all_patient_names {
    type: string
    sql: ${TABLE}.all_patient_names ;;
  }

  dimension: all_specieis_names {
    type: string
    sql: ${TABLE}.all_specieis_names ;;
  }

  dimension_group: appointment {
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
    sql: ${TABLE}.appointment_at ;;
  }

  dimension: appointment_id {
    type: number
    sql: ${TABLE}.appointment_id ;;
  }

  dimension: client_id {
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension_group: invoice_created {
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
    sql: ${TABLE}.invoice_created_at ;;
  }

  dimension: invoice_id {
    type: number
    sql: ${TABLE}.invoice_id ;;
  }

  dimension: num_of_credit {
    type: number
    sql: ${TABLE}.num_of_credit ;;
  }

  dimension: num_of_delivery {
    type: number
    sql: ${TABLE}.num_of_delivery ;;
  }

  dimension: num_of_diagnostic {
    type: number
    sql: ${TABLE}.num_of_diagnostic ;;
  }

  dimension: num_of_discount {
    type: number
    sql: ${TABLE}.num_of_discount ;;
  }

  dimension: num_of_euthanasia {
    type: number
    sql: ${TABLE}.num_of_euthanasia ;;
  }

  dimension: num_of_exam {
    type: number
    sql: ${TABLE}.num_of_exam ;;
  }

  dimension: num_of_medication {
    type: number
    sql: ${TABLE}.num_of_medication ;;
  }

  dimension: num_of_other {
    type: number
    sql: ${TABLE}.num_of_other ;;
  }

  dimension: num_of_patients {
    type: number
    sql: ${TABLE}.num_of_patients ;;
  }

  dimension: num_of_procedure {
    type: number
    sql: ${TABLE}.num_of_procedure ;;
  }

  dimension: num_of_refund {
    type: number
    sql: ${TABLE}.num_of_refund ;;
  }

  dimension: num_of_travel_fee {
    type: number
    sql: ${TABLE}.num_of_travel_fee ;;
  }

  dimension: num_of_vaccination {
    type: number
    sql: ${TABLE}.num_of_vaccination ;;
  }

  dimension: technician_name {
    type: string
    sql: ${TABLE}.technician_name ;;
  }

  dimension: total_amount_after_refund {
    type: number
    sql: ${TABLE}.total_amount_after_refund ;;
  }

  dimension: total_refund_amount {
    type: number
    sql: ${TABLE}.total_refund_amount ;;
  }

  dimension: vet_id {
    type: number
    sql: ${TABLE}.vet_id ;;
  }

  dimension: vet_name {
    type: string
    sql: ${TABLE}.vet_name ;;
  }

  dimension: service_area {
    type:  string
    sql:  ${TABLE}.service_area ;;
  }

  dimension: service_area_id {
    type: number
    sql:  ${TABLE}.service_area_id ;;
  }

  measure: count {
    type: count
    drill_fields: [technician_name, client_name, vet_name]
  }
}
