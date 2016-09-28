rem export NLS_LANG=AMERICAN_AMERICA.WE8ISO8859P1
set ORACLE_SID=ORCL
echo  start clt >> automigration.log
sqlldr c##staging2/canon ContractHeader.ctl
echo  ContractHeader >> automigration.log

if ERRORLEVEL 1 GOTO fout
sqlldr c##staging2/canon ContractLine.ctl
echo  ContractLine >> automigration.log

if ERRORLEVEL 1 GOTO fout
sqlldr c##staging2/canon ContractInvoiceSpecification.ctl
echo  ContractInvoiceSpecification >> automigration.log

if ERRORLEVEL 1 GOTO fout
sqlldr c##staging2/canon ContractObject.ctl
echo  ContractObject >> automigration.log

if ERRORLEVEL 1 GOTO fout
sqlldr c##staging2/canon ContractTimingTerm.ctl
echo  ContractTimingTerm >> automigration.log

if ERRORLEVEL 1 GOTO fout
sqlldr c##staging2/canon ContractClusterSpecification.ctl
echo  ContractClusterSpecification >> automigration.log

if ERRORLEVEL 1 GOTO fout
sqlldr c##staging2/canon ContractCondition.ctl
echo  ContractCondition >> automigration.log

if ERRORLEVEL 1 GOTO fout
sqlldr c##staging2/canon ContractLeaseCalculation.ctl
echo  ContractLeaseCalculation >> automigration.log

if ERRORLEVEL 1 GOTO fout
sqlldr c##staging2/canon ContractRevenueAllocation.ctl
echo  ContractRevenueAllocation >> automigration.log

if ERRORLEVEL 1 GOTO fout
sqlplus c##staging2/canon @checkload.sql
IF NOT ERRORLEVEL 1 GOTO :EOF
echo  error : checkload contract contract>> automigration.log
exit /b 1
:fout
exit /b 1

