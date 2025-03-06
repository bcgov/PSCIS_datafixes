-- ----------------------------------
-- https://github.com/smnorris/PSCIS_datafixes/issues/26
-- ----------------------------------
-- delete all weirs

DELETE FROM pscis.pscis_attachments
WHERE assessment_id in (1000,1001,4723,4745,4752,7517,7518,7519,7520,7531);

DELETE FROM pscis.pscis_crossing_assessments
WHERE stream_crossing_id in (1000,1001,4723,4745,4752,7517,7518,7519,7520,7531);

DELETE FROM pscis.pscis_structures
WHERE stream_crossing_id in (1000,1001,4723,4745,4752,7517,7518,7519,7520,7531);

DELETE FROM pscis.pscis_stream_cross_loc_point
WHERE stream_crossing_id in (1000,1001,4723,4745,4752,7517,7518,7519,7520,7531);


-- ----------------------------------
-- https://github.com/smnorris/PSCIS_datafixes/issues/9
-- ----------------------------------
-- just a single digit was off in the submission
UPDATE pscis.pscis_stream_cross_loc_point
SET
  utm_zone = 11,
  utm_easting = 644765,
  utm_northing = 5446625,
  geometry = SDO_GEOMETRY(
    2001,
    3005,
    SDO_POINT_TYPE(1798965.2, 522008.2, NULL),
    NULL,
    NULL
  ),
  who_updated = 'DATAFIX_20250315',
  when_updated = sysdate
WHERE stream_crossing_id = 62184;

-- ----------------------------------
-- https://github.com/smnorris/PSCIS_datafixes/issues/5
-- ----------------------------------
-- switch mis-classified crossings from OBS pipe arch to CBS culvert/oval culvert

UPDATE pscis.pscis_structures
SET
  crossing_type_code = 'CBS',
  crossing_subtype_code = 'OVAL',
  who_updated = 'DATAFIX_20250315',
  when_updated = sysdate
WHERE stream_crossing_id = 3138;

UPDATE pscis.pscis_crossing_assessments
SET
  culvert_length_score = 6,                 -- length=43m
  embed_score = 10,                         -- embedded=false
  outlet_drop_score = 10,                   -- drop=.46m
  culvert_slope_score = 0,                  -- slope=.8
  stream_width_ratio_score = 6,             -- swr=1.581
  final_score = 32,
  barrier_result_code = 'BARRIER',          -- >19 is a barrier
  who_updated = 'DATAFIX_20250315',
  when_updated = sysdate
WHERE stream_crossing_id = 3138;



-- ----------------------------------
-- https://github.com/smnorris/PSCIS_datafixes/issues/8
-- ----------------------------------
DELETE FROM pscis.pscis_attachments
WHERE assessment_id = 61615;

DELETE FROM pscis.pscis_crossing_assessments
WHERE assessment_id = 61615;

DELETE FROM pscis.pscis_structures
WHERE stream_crossing_id = 61502;

DELETE FROM pscis.pscis_stream_cross_loc_point
WHERE stream_crossing_id = 61502;


-- ----------------------------------
-- https://github.com/smnorris/PSCIS_datafixes/issues/4
-- ----------------------------------
UPDATE pscis.pscis_stream_cross_loc_point
SET
  utm_zone = 11,
  utm_easting = 372585,
  utm_northing = 5657234,
  geometry = SDO_GEOMETRY(
    2001,
    3005,
    SDO_POINT_TYPE(1502176.6,696424.7, NULL),
    NULL,
    NULL
  ),
  who_updated = 'DATAFIX_20250315',
  when_updated = sysdate
WHERE stream_crossing_id = 3554;


-- ----------------------------------
-- https://github.com/smnorris/PSCIS_datafixes/issues/22
-- ----------------------------------
UPDATE pscis.pscis_stream_cross_loc_point
SET
  utm_zone = 10,
  utm_easting = 515158,
  utm_northing = 6093463,
  geometry = SDO_GEOMETRY(
    2001,
    3005,
    SDO_POINT_TYPE(1206572.6, 1114594.9, NULL),
    NULL,
    NULL
  ),
  who_updated = 'DATAFIX_20250315',
  when_updated = sysdate
WHERE stream_crossing_id = 197488;


-- ----------------------------------
-- https://github.com/smnorris/PSCIS_datafixes/issues/15
-- ----------------------------------
-- delete submission 7190 and all associated data
DELETE FROM pscis.pscis_attachments
WHERE assessment_id = 199620;

DELETE FROM pscis.pscis_crossing_assessments
WHERE submission_id = 7190;

DELETE FROM pscis.pscis_structures
WHERE stream_crossing_id = 198380;

DELETE FROM pscis.pscis_stream_cross_loc_point
WHERE stream_crossing_id = 198380;

DELETE FROM pscis.pscis_submissions
WHERE submission_id = 7190;