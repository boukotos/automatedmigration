rem export NLS_LANG=AMERICAN_AMERICA.WE8ISO8859P1
set ORACLE_SID=ORCL
sqlplus c##staging2/canon @truncate.sql
echo %ERRORLEVEL%
if ERRORLEVEL 1 GOTO fout
sqlldr c##staging2/canon CustomerAccount.ctl
if ERRORLEVEL 1 GOTO fout
sqlldr c##staging2/canon CustomerVAT.ctl
if ERRORLEVEL 1 GOTO fout
sqlldr c##staging2/canon Address.ctl
if ERRORLEVEL 1 GOTO fout
sqlldr c##staging2/canon AddressRole.ctl
if ERRORLEVEL 1 GOTO fout
sqlldr c##staging2/canon CustomerRelation.ctl
if ERRORLEVEL 1 GOTO fout
sqlplus c##staging2/canon @craction.sql
if ERRORLEVEL 1 GOTO fout
sqlplus c##staging2/canon @caaction.sql
if ERRORLEVEL 1 GOTO fout
sqlplus c##staging2/canon @checkload.sql
IF NOT ERRORLEVEL 1 GOTO :EOF
echo  error : checkload >> automigration.log
exit /b 1
:fout
exit /b 1

