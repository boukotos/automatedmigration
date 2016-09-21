cd D:\automatedmigration\Partner
call checkloadcustomer.cmd
echo %ERRORLEVEL%
if NOT ERRORLEVEL 1 GOTO SCS
echo error : laod partner data finished with error >> automigration.log
exit /b 1
:SCS
echo No error : laod partner data finished >> automigration.log
cd D:\automatedmigration\