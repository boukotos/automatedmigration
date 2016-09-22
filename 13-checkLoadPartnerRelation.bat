cd D:\automatedmigration\Partner
call checkloadPartnerRelation.cmd
echo %ERRORLEVEL%
if NOT ERRORLEVEL 1 GOTO SCS
echo error : checkloadPartnerRelation error >> automigration.log
exit /b 1
:SCS
echo success : checkloadPartnerRelation >> automigration.log
cd D:\automatedmigration\