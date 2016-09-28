set ORACLE_SID=ORCL
sqlldr pearlautsta/pearlchain ConfigurationContact.ctl
if ERRORLEVEL 1 GOTO fout
sqlplus pearlautsta/pearlchain @checkloadConfigurationContact.sql
IF NOT ERRORLEVEL 1 GOTO :EOF
echo  error : checkloadConfigurationContact >> automigration.log
exit /b 1
:fout
exit /b 1
