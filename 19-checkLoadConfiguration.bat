cd D:\automatedmigration\configuration
call checkloadconfiguration.cmd
echo %ERRORLEVEL%
if NOT ERRORLEVEL 1 GOTO SCS
echo error :  checkloadconfiguration data finished with error >> automigration.log
exit /b 1
:SCS
echo No error :  checkloadconfiguration data finished >> automigration.log
cd D:\automatedmigration\