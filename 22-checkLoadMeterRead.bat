cd D:\automatedmigration\configuration
call checkloadMeterReads.cmd
echo %ERRORLEVEL%
if NOT ERRORLEVEL 1 GOTO SCS
echo error : laod checkloadMeterReads data finished with error >> automigration.log
exit /b 1
:SCS
echo No error : laod checkloadMeterReads data finished >> automigration.log
cd D:\automatedmigration\