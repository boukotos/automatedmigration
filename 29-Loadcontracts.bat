cd D:\automatedmigration\contract
call loaddcontract.cmd
if NOT ERRORLEVEL 1 GOTO SCS
exit /b 1
:SCS
cd D:\automatedmigration\