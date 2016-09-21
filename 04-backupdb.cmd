set ORACLE_SID=ORCL
expdp system/pearlchain logfile=exp_AUTO_PEARLAUT.log schemas=PEARLAUT directory=DATA_PUMP_DIR CONSISTENT=Y dumpfile=AUTO_PEARLAUT.dmp exclude=statistics REUSE_DUMPFILES=Y
expdp system/pearlchain logfile=exp_AUTO_PEARLAUTSTA.log schemas=PEARLAUTSTA directory=DATA_PUMP_DIR CONSISTENT=Y dumpfile=AUTO_PEARLAUTSTA.dmp exclude=statistics REUSE_DUMPFILES=Y
