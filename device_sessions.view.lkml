view: device_sessions {
  derived_table: {
    sql: SELECT x.week,x.Desktop,y.Mobile
      from (
      SELECT
        TO_CHAR(DATE_TRUNC('week', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', segment_vetted_tracks.timestamp )), 'YYYY-MM-DD') AS "week",
        COUNT(DISTINCT segment_vetted_session_tracks.anonymous_id ) AS "Desktop"
      FROM looker_scratch.LR$KPJXWTDMO2ZFL26PXZQLG_segment_vetted_track_facts AS segment_vetted_track_facts
      LEFT JOIN javascript.tracks  AS segment_vetted_tracks ON segment_vetted_tracks.uuid = segment_vetted_track_facts.uuid and
            segment_vetted_tracks.received_at = segment_vetted_track_facts.received_at and
            segment_vetted_tracks.anonymous_id = segment_vetted_track_facts.anonymous_id

      LEFT JOIN looker_scratch.LR$KPOYRW9UTZEJXD4W1U3VF_segment_vetted_session_tracks AS segment_vetted_session_tracks ON segment_vetted_track_facts.session_id = segment_vetted_session_tracks.session_id

      WHERE (segment_vetted_tracks.context_user_agent NOT LIKE '%StatusCake%') AND (segment_vetted_tracks.context_user_agent LIKE '%Windows%') OR (segment_vetted_tracks.context_user_agent LIKE '%Macintosh%') AND ((((segment_vetted_tracks.timestamp ) >= ((CONVERT_TIMEZONE('America/Los_Angeles', 'UTC', DATEADD(week,-7, DATE_TRUNC('week', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', GETDATE()))) )))) AND (segment_vetted_tracks.timestamp ) < ((CONVERT_TIMEZONE('America/Los_Angeles', 'UTC', DATEADD(week,8, DATEADD(week,-7, DATE_TRUNC('week', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', GETDATE()))) ) )))))))
      GROUP BY DATE_TRUNC('week', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', segment_vetted_tracks.timestamp ))
      ORDER BY 1 ,2) as x,
      (SELECT
        TO_CHAR(DATE_TRUNC('week', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', segment_vetted_tracks.timestamp )), 'YYYY-MM-DD') AS "week",
        COUNT(DISTINCT segment_vetted_session_tracks.anonymous_id ) AS "Mobile"
      FROM looker_scratch.LR$KPJXWTDMO2ZFL26PXZQLG_segment_vetted_track_facts AS segment_vetted_track_facts
      LEFT JOIN javascript.tracks  AS segment_vetted_tracks ON segment_vetted_tracks.uuid = segment_vetted_track_facts.uuid and
            segment_vetted_tracks.received_at = segment_vetted_track_facts.received_at and
            segment_vetted_tracks.anonymous_id = segment_vetted_track_facts.anonymous_id

      LEFT JOIN looker_scratch.LR$KPOYRW9UTZEJXD4W1U3VF_segment_vetted_session_tracks AS segment_vetted_session_tracks ON segment_vetted_track_facts.session_id = segment_vetted_session_tracks.session_id
      WHERE (segment_vetted_tracks.context_user_agent NOT LIKE '%StatusCake%') AND (segment_vetted_tracks.context_user_agent NOT LIKE '%Windows%') AND (segment_vetted_tracks.context_user_agent NOT LIKE '%Macintosh%') AND ((((segment_vetted_tracks.timestamp ) >= ((CONVERT_TIMEZONE('America/Los_Angeles', 'UTC', DATEADD(week,-7, DATE_TRUNC('week', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', GETDATE()))) )))) AND (segment_vetted_tracks.timestamp ) < ((CONVERT_TIMEZONE('America/Los_Angeles', 'UTC', DATEADD(week,8, DATEADD(week,-7, DATE_TRUNC('week', DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', GETDATE()))) ) )))))))
      GROUP BY DATE_TRUNC('week', CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', segment_vetted_tracks.timestamp ))
      ORDER BY 1 ,2) as y
      WHERE x.week=y.week
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: week {
    type: string
    sql: ${TABLE}.week ;;
  }

  dimension: desktop {
    type: number
    sql: ${TABLE}.desktop ;;
  }

  dimension: mobile {
    type: number
    sql: ${TABLE}.mobile ;;
  }

  set: detail {
    fields: [week, desktop, mobile]
  }
}
