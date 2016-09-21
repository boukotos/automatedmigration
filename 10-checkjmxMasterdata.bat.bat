cd D:\automatedmigration\masterdata
call checkloadMasterdata.cmd
if NOT ERRORLEVEL 1 GOTO SCS
echo error : laod Masterdata data finished with error >> automigration.log
exit /b 1
:SCS
echo No error : laod Masterdata data finished >> automigration.log
cd D:\automatedmigration\