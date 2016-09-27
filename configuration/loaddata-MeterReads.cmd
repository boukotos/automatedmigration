rem export NLS_LANG=AMERICAN_AMERICA.WE8ISO8859P1
set ORACLE_SID=ORCL
sqlldr c##staging2/canon meterRead.ctl
if ERRORLEVEL 1 GOTO fout
sqlplus c##staging2/canon @checkloadMeterRead.sql
IF NOT ERRORLEVEL 1 GOTO :EOF
echo  error : checkload >> automigration.log
exit /b 1
:fout
exit /b 1
