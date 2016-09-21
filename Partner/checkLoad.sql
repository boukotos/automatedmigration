WHENEVER SQLERROR EXIT FAILURE;
DECLARE
   migration_error EXCEPTION;
   PRAGMA EXCEPTION_INIT(migration_error, -20000);
   counter NUMBER;
BEGIN
SELECT count(0) INTO counter FROM IMP_AD;
IF counter!=123 THEN 
	RAISE migration_error;
END IF;
/* SELECT count(0) INTO counter FROM IMP_ADR;
IF counter!=280 THEN 
	RAISE migration_error;
END IF;
SELECT count(0) INTO counter FROM IMP_CA;
IF counter!=28 THEN 
	RAISE migration_error;
END IF;
SELECT count(0) INTO counter FROM IMP_CR;
IF counter!=1 THEN 
	RAISE migration_error;
END IF;
SELECT count(0) INTO counter FROM IMP_CV;
IF counter!=27 THEN 
	RAISE migration_error;
END IF; */
END;
/
exit;