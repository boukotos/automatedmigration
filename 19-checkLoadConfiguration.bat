cd D:\automatedmigration\configuration
call checkloadconfiguration.cmd
echo %ERRORLEVEL%
if NOT ERRORLEVEL 1 GOTO SCS
echo error : laod Product Properties data finished with error >> automigration.log
exit /b 1
:SCS
echo No error : laod Product Properties data finished >> automigration.log
cd D:\automatedmigration\