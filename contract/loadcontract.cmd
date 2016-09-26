rem export NLS_LANG=AMERICAN_AMERICA.WE8ISO8859P1
set ORACLE_SID=XE

sqlldr canonmig/pearlchain ContractHeader.ctl
sqlldr canonmig/pearlchain ContractLine.ctl
sqlldr canonmig/pearlchain ContractInvoiceSpecification.ctl
sqlldr canonmig/pearlchain ContractObject.ctl
sqlldr canonmig/pearlchain ContractTimingTerm.ctl
sqlldr canonmig/pearlchain ContractClusterSpecification.ctl
sqlldr canonmig/pearlchain ContractCondition.ctl
sqlldr canonmig/pearlchain ContractLeaseCalculation.ctl
sqlldr canonmig/pearlchain ContractRevenueAllocation.ctl

sqlplus canonmig/pearlchain @cdact.sql
sqlplus canonmig/pearlchain @gxaction.sql

pause
