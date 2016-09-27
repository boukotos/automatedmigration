WHENEVER SQLERROR EXIT sql.sqlcode;
DECLARE
   migration_error EXCEPTION;
   PRAGMA EXCEPTION_INIT(migration_error, -20000);
   counter NUMBER;
BEGIN
SELECT count(0) INTO counter FROM GX WHERE GXSTAT ='FAILED';
IF counter!=0 THEN 
	RAISE migration_error;
END IF;
END;
/
exit;