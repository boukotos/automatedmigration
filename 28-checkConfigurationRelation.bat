cd D:\automatedmigration\configuration
call checkloadconfigurationRelation.cmd
echo %ERRORLEVEL%
if NOT ERRORLEVEL 1 GOTO SCS
echo error : laod checkloadconfigurationRelation data finished with error >> automigration.log
exit /b 1
:SCS
echo No error : laod checkloadconfigurationRelation data finished >> automigration.log
cd D:\automatedmigration\