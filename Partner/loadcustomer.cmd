rem export NLS_LANG=AMERICAN_AMERICA.WE8ISO8859P1
set ORACLE_SID=ORCL
sqlplus pearlautsta/pearlchain @truncate.sql
echo %ERRORLEVEL%
if ERRORLEVEL 1 GOTO fout
sqlldr pearlautsta/pearlchain CustomerAccount.ctl
if ERRORLEVEL 1 GOTO fout
sqlldr pearlautsta/pearlchain CustomerVAT.ctl
if ERRORLEVEL 1 GOTO fout
sqlldr pearlautsta/pearlchain Address.ctl
if ERRORLEVEL 1 GOTO fout
sqlldr pearlautsta/pearlchain AddressRole.ctl
if ERRORLEVEL 1 GOTO fout
sqlldr pearlautsta/pearlchain CustomerRelation.ctl
if ERRORLEVEL 1 GOTO fout
sqlplus pearlautsta/pearlchain @craction.sql
if ERRORLEVEL 1 GOTO fout
sqlplus pearlautsta/pearlchain @caaction.sql
if ERRORLEVEL 1 GOTO fout
sqlplus pearlautsta/pearlchain @checkload.sql
IF NOT ERRORLEVEL 1 GOTO :EOF
echo  error : checkload >> automigration.log
exit /b 1
:fout
exit /b 1

