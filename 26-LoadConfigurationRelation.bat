cd D:\automatedmigration\configuration
call loaddata-ConfigRelation.cmd
if NOT ERRORLEVEL 1 GOTO SCS
exit /b 1
:SCS
cd D:\automatedmigration\