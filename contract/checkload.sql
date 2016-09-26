WHENEVER SQLERROR EXIT FAILURE;
DECLARE
   migration_error EXCEPTION;
   PRAGMA EXCEPTION_INIT(migration_error, -20000);
   counter NUMBER;
BEGIN
SELECT count(0) INTO counter FROM IMP_GX;
IF counter!=123 THEN 
	RAISE migration_error;
END IF;
SELECT count(0) INTO counter FROM IMP_GC;
IF counter!=280 THEN 
	RAISE migration_error;
END IF;
SELECT count(0) INTO counter FROM IMP_IG;
IF counter!=28 THEN 
	RAISE migration_error;
END IF;
SELECT count(0) INTO counter FROM IMP_CO;
IF counter!=1 THEN 
	RAISE migration_error;
END IF;
SELECT count(0) INTO counter FROM IMP_TI;
IF counter!=27 THEN 
	RAISE migration_error;
END IF;
SELECT count(0) INTO counter FROM IMP_RP;
IF counter!=27 THEN 
	RAISE migration_error;
END IF;
SELECT count(0) INTO counter FROM IMP_CB;
IF counter!=27 THEN 
	RAISE migration_error;
END IF;
SELECT count(0) INTO counter FROM IMP_C2;
IF counter!=27 THEN 
	RAISE migration_error;
END IF;
SELECT count(0) INTO counter FROM IMP_COR;
IF counter!=27 THEN 
	RAISE migration_error;
END IF; 

END;
/
exit;