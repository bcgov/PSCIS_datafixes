-- ----------------------------------
-- https://github.com/smnorris/PSCIS_datafixes/issues/24
-- ----------------------------------
UPDATE pscis.pscis_attachments
SET assessment_id = 200820
WHERE attachment_id IN (1080860,1080861,1080862,1080863,1080864,1080865,1080866,1080867);

UPDATE pscis.pscis_attachments
SET assessment_id = 200810
WHERE attachment_id IN (1080939,1080940,1080941,1080942,1080943,1080944,1080945,1080946);

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
DELETE FROM pscis.pscis_crossing_assessments
WHERE submission_id = 7190;

DELETE FROM pscis.pscis_structures
WHERE stream_crossing_id = 198380;

DELETE FROM pscis.pscis_stream_cross_loc_point
WHERE stream_crossing_id = 198380;

DELETE FROM pscis.pscis_submissions
WHERE submission_id = 7190;

DELETE FROM pscis.pscis_attachments
WHERE assessment_id = 199620;