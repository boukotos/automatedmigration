set ORACLE_SID=XE
sqlldr c##staging2/canon PRP_ItemNSOData.ctl
if ERRORLEVEL 1 GOTO fout
sqlplus c##staging2/canon @checkload.sql
IF NOT ERRORLEVEL 1 GOTO :EOF
echo error : PRP checkload >> automigration.log

:fout
exit /b 1
