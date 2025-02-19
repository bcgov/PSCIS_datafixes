-- ----------------------------------
-- https://github.com/smnorris/PSCIS_datafixes/issues/24
-- ----------------------------------
UPDATE pscis.pscis_attachments
SET assessment_id = 200820
WHERE attachment_id IN (1080860,1080861,1080862,1080863,1080864,1080865,1080866,1080867);

UPDATE pscis.pscis_attachments
SET assessment_id = 200810
WHERE attachment_id IN (1080939,1080940,1080941,1080942,1080943,1080944,1080945,1080946);




