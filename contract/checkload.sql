WHENEVER SQLERROR EXIT FAILURE;
DECLARE
   migration_error EXCEPTION;
   PRAGMA EXCEPTION_INIT(migration_error, -20000);
   counter NUMBER;
BEGIN
SELECT count(0) INTO counter FROM IMP_GX;
IF counter<0 THEN 
	RAISE migration_error;
END IF;
SELECT count(0) INTO counter FROM IMP_GC;
IF counter<0 THEN 
	RAISE migration_error;
END IF;
SELECT count(0) INTO counter FROM IMP_IG;
IF counter<0 THEN 
	RAISE migration_error;
END IF;
SELECT count(0) INTO counter FROM IMP_CO;
IF counter<0 THEN 
	RAISE migration_error;
END IF;
SELECT count(0) INTO counter FROM IMP_TI;
IF counter<0 THEN 
	RAISE migration_error;
END IF;
SELECT count(0) INTO counter FROM IMP_RP;
IF counter<0 THEN 
	RAISE migration_error;
END IF;
SELECT count(0) INTO counter FROM IMP_CB;
IF counter<0 THEN 
	RAISE migration_error;
END IF;
SELECT count(0) INTO counter FROM IMP_C2;
IF counter<0 THEN 
	RAISE migration_error;
END IF;
SELECT count(0) INTO counter FROM IMP_COR;
IF counter<0 THEN 
	RAISE migration_error;
END IF; 

END;
/
exit;