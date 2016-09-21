WHENEVER SQLERROR EXIT sql.sqlcode;
DECLARE
   migration_error EXCEPTION;
   PRAGMA EXCEPTION_INIT(migration_error, -20000);
   counter NUMBER;
BEGIN
SELECT count(0) INTO counter FROM CA WHERE CASTAT ='FINISHED';
IF counter!=28 THEN 
	RAISE migration_error;
END IF;
END;
/
exit;