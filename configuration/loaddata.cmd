rem export NLS_LANG=AMERICAN_AMERICA.WE8ISO8859P1
set ORACLE_SID=ORCL

sqlldr pearlautsta/pearlchain metercomponent.ctl
if ERRORLEVEL 1 GOTO fout
sqlldr pearlautsta/pearlchain meterclasscomponent.ctl
if ERRORLEVEL 1 GOTO fout
sqlldr pearlautsta/pearlchain component.ctl
if ERRORLEVEL 1 GOTO fout
sqlldr pearlautsta/pearlchain configuration.ctl
if ERRORLEVEL 1 GOTO fout
sqlplus pearlautsta/pearlchain @checkload.sql
IF NOT ERRORLEVEL 1 GOTO :EOF
echo  error : checkload >> automigration.log
exit /b 1
:fout
exit /b 1
