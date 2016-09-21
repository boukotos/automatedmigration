cd D:\automatedmigration\Partner
call loadcustomer.cmd
if NOT ERRORLEVEL 1 GOTO SCS
exit /b 1
:SCS
cd D:\automatedmigration\



