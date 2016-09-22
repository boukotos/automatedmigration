REM echo %date% %time% > automigration.log
REM call 01-updateworkspace.cmd >> automigration.log
REM if errorlevel 1 GOTO updateworkspace
REM call 02-build.cmd >> automigration.log
REM if errorlevel 1 GOTO build
REM call 03-stops.bat tomcat7 >> automigration.log
REM if errorlevel 1 GOTO holdyourhorses

REM call 04-backupdb.cmd >> automigration.log
REM if errorlevel 1 GOTO backup
REM call 05-runsql.cmd >> automigration.log
REM if errorlevel 1 GOTO runsql
REM call 06-deploy.cmd >> automigration.log
REM if errorlevel 1 GOTO deploy

REM PING -n 201 127.0.0.1 >> automigration.log

REM call 07-jmx.bat >> automigration.log
REM if ERRORLEVEL 0 GOTO jmxsuccess
REM GOTO EOF
REM :jmxsuccess

call 08-loadpartnerData.bat > automigration.log
if NOT ERRORLEVEL 1 GOTO SCS
exit /b 1
:SCS
call 09-jmxPartner.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO jmxpartnersuccess
echo error : laod partner jmxPartner >> automigration.log
exit /b 1
:jmxpartnersuccess
call 11-checkLoadpartnerData.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO checkLoadpartnerDataSuccess
echo error : laod partner data finished with errors >> automigration.log
exit /b 1
:checkLoadpartnerDataSuccess
echo No error : laod partner data finished >> automigration.log
call 10-jmxMasterdata.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO jmxmasterdatasuccess
exit /b 1
:jmxmasterdatasuccess
echo No error : laod partner data finished >> automigration.log
call 10-checkjmxMasterdata.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO checkJmxmasterdatasuccess
exit /b 1
:checkJmxmasterdatasuccess
call 12-jmxPartnerRelation.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO jmxPartnerRelation
echo error : jmxPartnerRelation >> automigration.log
exit /b 1
:jmxPartnerRelation
call 13-checkLoadPartnerRelation.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO checkLoadPartnerRelationSuccess
echo error : checkLoadPartnerRelation errors >> automigration.log
exit /b 1
checkLoadPartnerRelationSuccess
echo laoding Partner Relation data finished  >> automigration.log

call 14-jmxProductproperties.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO jmxPartnerRelation
echo error : jmxProductproperties >> automigration.log
exit /b 1
:jmxPartnerRelation
call 14-checkLoadProductproperties.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO checkLoadProductpropertiesSuccess
echo error : checkLoadProductproperties errors >> automigration.log
exit /b 1
checkLoadProductpropertiesSuccess
echo laoding productproperties data finished  >> automigration.log

REM echo %date% %time% >> automigration.log

REM GOTO eof

REM :holdyourhorses
REM echo services could not be stopped >> automigration.log
REM GOTO eof

REM :updateworkspace
REM echo workspace could not be updated >> automigration.log
REM GOTO eof

REM :build
REM echo build failed >> automigration.log
REM GOTO eof

REM :backup
REM echo backup failed >> automigration.log
REM GOTO eof

REM :runsql
REM echo sql failed >> automigration.log
REM GOTO eof

REM :deploy
REM echo deployment failed  >> automigration.log
GOTO eof







