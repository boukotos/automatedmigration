rem export NLS_LANG=AMERICAN_AMERICA.WE8ISO8859P1
set ORACLE_SID=ORCL
sqlldr c##staging2/canon ContractHeader.ctl
if ERRORLEVEL 1 GOTO fout
sqlldr c##staging2/canon ContractLine.ctl
if ERRORLEVEL 1 GOTO fout
sqlldr c##staging2/canon ContractInvoiceSpecification.ctl
if ERRORLEVEL 1 GOTO fout
sqlldr c##staging2/canon ContractObject.ctl
if ERRORLEVEL 1 GOTO fout
sqlldr c##staging2/canon ContractTimingTerm.ctl
if ERRORLEVEL 1 GOTO fout
sqlldr c##staging2/canon ContractClusterSpecification.ctl
if ERRORLEVEL 1 GOTO fout
sqlldr c##staging2/canon ContractCondition.ctl
if ERRORLEVEL 1 GOTO fout
sqlldr c##staging2/canon ContractLeaseCalculation.ctl
if ERRORLEVEL 1 GOTO fout
sqlldr c##staging2/canon ContractRevenueAllocation.ctl
if ERRORLEVEL 1 GOTO fout
sqlplus c##staging2/canon @checkload.sql
IF NOT ERRORLEVEL 1 GOTO :EOF
echo  error : checkload contract>> automigration.log
exit /b 1
:fout
exit /b 1

pause
