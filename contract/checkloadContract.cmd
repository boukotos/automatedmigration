rem export NLS_LANG=AMERICAN_AMERICA.WE8ISO8859P1
set ORACLE_SID=ORCL
sqlplus pearlautsta/pearlchain @checkAfterload.sql
if NOT ERRORLEVEL 1 GOTO :EOF
exit /b 1
