CREATE OR REPLACE PROCEDURE TESTDATE1.DATE_PROC(IN DESC VARCHAR(10))
DYNAMIC RESULT SETS 1 P1:BEGIN DECLARE input_date_stamp TIMESTAMP;
			DECLARE stored_date_stamp TIMESTAMP;
			DECLARE last_date_of_month_stamp TIMESTAMP;
			DECLARE month_diff_time_stamp INT;

SET input_date_stamp = TIMESTAMP_FORMAT(DESC,'MONTH-YYYY');
SET stored_date_stamp = (SELECT COLUMN1 FROM TESTDATE1.NEWTABLE FETCH FIRST 1 ROW ONLY);
SET last_date_of_month_stamp =	LAST_DAY(input_date_stamp);
SET month_diff_time_stamp = TIMESTAMPDIFF(64,TIMESTAMP(last_date_of_month_stamp)-TIMESTAMP(stored_date_stamp));

--MONTH(DATE1) - MONTH(DATE2)
--INSERT
--   INTO  TESTDATE1.NEWTABLE(COLUMN1)
--   VALUES(output_date_string);


p2:BEGIN DECLARE cursor3 CURSOR WITH RETURN FOR SELECT
   --	out_date_string AS "DATE"
 stored_date_stamp AS "stored Date" , input_date_stamp AS "Input Date" ,   month_diff_time_stamp  AS "DATE"
FROM    SYSIBM.dual;


OPEN cursor3;

END p2;

END p1

CALL TESTDATE1.DATE_PROC('DEC-2028');

