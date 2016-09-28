WHENEVER SQLERROR EXIT FAILURE;
DECLARE
   migration_error EXCEPTION;
   PRAGMA EXCEPTION_INIT(migration_error, -20000);
   counter NUMBER;
BEGIN
SELECT count(0) INTO counter FROM IMP_CI;
IF counter < 0 THEN 
	RAISE migration_error;
END IF;
SELECT count(0) INTO counter FROM IMP_CM;
IF counter < 0 THEN 
	RAISE migration_error;
END IF;
END;
/
exit;