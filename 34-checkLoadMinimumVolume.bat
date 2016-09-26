cd D:\automatedmigration\Minimum-Volume
call checkloadMinimumVolume.cmd
echo %ERRORLEVEL%
if NOT ERRORLEVEL 1 GOTO SCS
echo error : laod checkloadMinimumVolume data finished with error >> automigration.log
exit /b 1
:SCS
echo No error : laod checkloadMinimumVolume data finished >> automigration.log
cd D:\automatedmigration\