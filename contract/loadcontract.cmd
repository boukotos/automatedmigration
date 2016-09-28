rem export NLS_LANG=AMERICAN_AMERICA.WE8ISO8859P1
set ORACLE_SID=ORCL
echo  start clt >> automigration.log
sqlldr pearlautsta/pearlchain ContractHeader.ctl
echo  ContractHeader >> automigration.log

if ERRORLEVEL 1 GOTO fout
sqlldr pearlautsta/pearlchain ContractLine.ctl
echo  ContractLine >> automigration.log

if ERRORLEVEL 1 GOTO fout
sqlldr pearlautsta/pearlchain ContractInvoiceSpecification.ctl
echo  ContractInvoiceSpecification >> automigration.log

if ERRORLEVEL 1 GOTO fout
sqlldr pearlautsta/pearlchain ContractObject.ctl
echo  ContractObject >> automigration.log

if ERRORLEVEL 1 GOTO fout
sqlldr pearlautsta/pearlchain ContractTimingTerm.ctl
echo  ContractTimingTerm >> automigration.log

if ERRORLEVEL 1 GOTO fout
sqlldr pearlautsta/pearlchain ContractClusterSpecification.ctl
echo  ContractClusterSpecification >> automigration.log

if ERRORLEVEL 1 GOTO fout
sqlldr pearlautsta/pearlchain ContractCondition.ctl
echo  ContractCondition >> automigration.log

if ERRORLEVEL 1 GOTO fout
sqlldr pearlautsta/pearlchain ContractLeaseCalculation.ctl
echo  ContractLeaseCalculation >> automigration.log

if ERRORLEVEL 1 GOTO fout
sqlldr pearlautsta/pearlchain ContractRevenueAllocation.ctl
echo  ContractRevenueAllocation >> automigration.log

if ERRORLEVEL 1 GOTO fout
sqlplus pearlautsta/pearlchain @checkload.sql
IF NOT ERRORLEVEL 1 GOTO :EOF
echo  error : checkload contract contract>> automigration.log
exit /b 1
:fout
exit /b 1

