set ORACLE_SID=ORCL
sqlldr c##staging2/canon ConfigurationContact.ctl
if ERRORLEVEL 1 GOTO fout
sqlplus c##staging2/canon @checkloadConfigurationContact.sql
IF NOT ERRORLEVEL 1 GOTO :EOF
echo  error : checkloadConfigurationContact >> automigration.log
exit /b 1
:fout
exit /b 1
