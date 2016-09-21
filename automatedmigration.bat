echo %date% %time% > automigration.log
call updateworkspace.cmd >> automigration.log
if errorlevel 1 GOTO updateworkspace
call build.cmd >> automigration.log
if errorlevel 1 GOTO build
call stops.bat tomcat7 >> automigration.log
if errorlevel 1 GOTO holdyourhorses

call backupdb.cmd >> automigration.log
if errorlevel 1 GOTO backup
call runsql.cmd >> automigration.log
if errorlevel 1 GOTO runsql
call deploy.cmd >> automigration.log
if errorlevel 1 GOTO deploy

PING -n 201 127.0.0.1 >> automigration.log

call jmx.bat >> automigration.log
if ERRORLEVEL 0 GOTO jmxsuccess
GOTO EOF
:jmxsuccess

call loadpartnerData.bat >> automigration.log
if ERRORLEVEL 0 GOTO SCS
exit /b 1
:SCS

call jmxPartner.bat >> automigration.log
if ERRORLEVEL 0 GOTO jmxpartnersuccess
:jmxpartnersuccess

call jmxMasterdata.bat >> automigration.log
if ERRORLEVEL 0 GOTO jmxmasterdatasuccess
:jmxmasterdatasuccess


echo %date% %time% >> automigration.log

GOTO eof

:holdyourhorses
echo services could not be stopped >> automigration.log
GOTO eof

:updateworkspace
echo workspace could not be updated >> automigration.log
GOTO eof

:build
echo build failed >> automigration.log
GOTO eof

:backup
echo backup failed >> automigration.log
GOTO eof

:runsql
echo sql failed >> automigration.log
GOTO eof

:deploy
echo deployment failed  >> automigration.log
GOTO eof







