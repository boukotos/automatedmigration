cd D:\automatedmigration\contract
call checkloadContract.cmd
echo %ERRORLEVEL%
if NOT ERRORLEVEL 1 GOTO SCS
echo error : laod checkloadContract data finished with error >> automigration.log
exit /b 1
:SCS
echo No error : laod checkloadContract data finished >> automigration.log
cd D:\automatedmigration\