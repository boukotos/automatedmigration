rem export NLS_LANG=AMERICAN_AMERICA.WE8ISO8859P1
set ORACLE_SID=ORCL
sqlldr pearlautsta/pearlchain configurationRelation.ctl
if ERRORLEVEL 1 GOTO fout
sqlplus pearlautsta/pearlchain @checkloadConfigurationRelation.sql
IF NOT ERRORLEVEL 1 GOTO :EOF
echo  error : checkloadConfigurationRelation >> automigration.log
exit /b 1
:fout
exit /b 1