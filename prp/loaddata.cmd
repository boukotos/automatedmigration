set ORACLE_SID=ORCL
sqlldr pearlautsta/pearlchain PRP_ItemNSOData.ctl
if ERRORLEVEL 1 GOTO fout
sqlplus pearlautsta/pearlchain @checkload.sql
IF NOT ERRORLEVEL 1 GOTO :EOF
echo error : PRP checkload >> automigration.log

:fout
exit /b 1
