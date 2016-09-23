cd D:\automatedmigration\configuration
call checkloadconfigurationContact.cmd
echo %ERRORLEVEL%
if NOT ERRORLEVEL 1 GOTO SCS
echo error : laod checkloadconfigurationContact data finished with error >> automigration.log
exit /b 1
:SCS
echo No error : laod checkloadconfigurationContact data finished >> automigration.log
cd D:\automatedmigration\