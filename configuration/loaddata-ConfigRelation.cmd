rem export NLS_LANG=AMERICAN_AMERICA.WE8ISO8859P1
set ORACLE_SID=ORCL

sqlldr c##staging2/canon configurationRelation.ctl
if ERRORLEVEL 1 GOTO fout
sqlplus c##staging2/canon @checkloadConfigurationRelation.sql
IF NOT ERRORLEVEL 1 GOTO :EOF
echo  error : checkloadConfigurationRelation >> automigration.log
exit /b 1
:fout
exit /b 1