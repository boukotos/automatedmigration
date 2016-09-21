D:
cd "\automatedmigration\Canon\canon-services\migration\domainmodel\1.7.5.9\partitioned"
sqlplus pearlaut/pearlchain @"p0-00 run all.sql"
sqlplus pearlautsta/pearlchain @"staging_run_all.sql"
cd "\automatedmigration\"
