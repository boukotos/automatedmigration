rem export NLS_LANG=AMERICAN_AMERICA.WE8ISO8859P1
set ORACLE_SID=ORCL

sqlldr c##staging2/canon metercomponent.ctl
if ERRORLEVEL 1 GOTO fout
sqlldr c##staging2/canon meterclasscomponent.ctl
if ERRORLEVEL 1 GOTO fout
sqlldr c##staging2/canon component.ctl
if ERRORLEVEL 1 GOTO fout
sqlldr c##staging2/canon configuration.ctl
if ERRORLEVEL 1 GOTO fout
sqlplus c##staging2/canon @checkload.sql
IF NOT ERRORLEVEL 1 GOTO :EOF
echo  error : checkload >> automigration.log
exit /b 1
:fout
exit /b 1
