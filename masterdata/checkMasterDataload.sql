WHENEVER SQLERROR EXIT FAILURE;
DECLARE
   migration_error EXCEPTION;
   PRAGMA EXCEPTION_INIT(migration_error, -20000);
   counter NUMBER;
BEGIN
counter := 1 ;
WHILE counter != 0
LOOP
   SELECT count(0) INTO counter FROM if_message WHERE QUEUENAME in ('ProductIn','migration') AND STATUS = 'NEW';
   counter := counter;
   dbms_lock.sleep( 2 ); 
END LOOP;

SELECT count(0) INTO counter FROM if_message WHERE QUEUENAME = 'migration' AND STATUS = 'ERROR';
IF counter!=0 THEN 
	RAISE migration_error;
END IF;

SELECT count(0) INTO counter FROM if_message2 WHERE QUEUENAME = 'ProductIn' AND STATUS = 'ERROR';
IF counter!=0 THEN 
	RAISE migration_error;
END IF;

END;
/
exit;