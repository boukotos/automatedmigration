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

echo start :  partner >> automigration.log
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

echo start :  Masterdata >> automigration.log

call 10-jmxMasterdata.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO jmxmasterdatasuccess
exit /b 1
:jmxmasterdatasuccess
echo No error : laod partner data finished >> automigration.log
call 10-checkjmxMasterdata.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO checkJmxmasterdatasuccess
exit /b 1
:checkJmxmasterdatasuccess

echo start :  PartnerRelation >> automigration.log

call 12-jmxPartnerRelation.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO jmxPartnerRelation
echo error : jmxPartnerRelation >> automigration.log
exit /b 1
:jmxPartnerRelation
call 13-checkLoadPartnerRelation.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO checkLoadPartnerRelationSuccess
echo error : checkLoadPartnerRelation errors >> automigration.log
exit /b 1
:checkLoadPartnerRelationSuccess
echo laoding Partner Relation data finished  >> automigration.log

echo start :  roductproperties >> automigration.log

call 14-LoadProductproperties.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO LoadProductproperties
echo error : LoadProductproperties >> automigration.log
exit /b 1
:LoadProductproperties
echo laoding productproperties data finished  >> automigration.log
call 15-jmxProductproperties.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO jmxPartnerRelation
echo error : jmxProductproperties >> automigration.log
exit /b 1
:jmxPartnerRelation
call 16-checkLoadProductproperties.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO checkLoadProductpropertiesSuccess
echo error : checkLoadProductproperties errors >> automigration.log
exit /b 1
:checkLoadProductpropertiesSuccess
echo check laoding productproperties data finished  >> automigration.log

echo start : Minimum Volume >> automigration.log


call 32-LoadMinimumVolume.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO LoadMinimumVolume
echo error : LoadMinimumVolume >> automigration.log
exit /b 1
:LoadMinimumVolume
echo laoding LoadMinimumVolume data finished  >> automigration.log
call 33-jmxLoadMinimumVolume.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO jmxLoadMinimumVolume
echo error : jmxLoadMinimumVolume >> automigration.log
exit /b 1
:jmxLoadMinimumVolume
call 34-checkLoadMinimumVolume.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO checkLoadMinimumVolumeSuccess
echo error : checkLoadMinimumVolume errors >> automigration.log
exit /b 1
:checkLoadMinimumVolumeSuccess

echo start :  Configuration >> automigration.log


call 17-LoadConfiguration.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO LoadConfiguration
echo error : LoadConfiguration >> automigration.log
exit /b 1
:LoadConfiguration
echo laoding LoadConfiguration data finished  >> automigration.log
call 18-jmxConfiguration.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO jmxConfiguration
echo error : jmxConfiguration >> automigration.log
exit /b 1
:jmxConfiguration
call 19-checkLoadConfiguration.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO checkLoadConfigurationSuccess
echo error : checkLoadConfiguration errors >> automigration.log
exit /b 1
:checkLoadConfigurationSuccess

echo start :  MeterRead >> automigration.log

call 20-LoadMeterRead.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO LoadMeterRead
echo error : LoadMeterRead >> automigration.log
exit /b 1
:LoadMeterRead
echo laoding LoadMeterRead data finished  >> automigration.log
call 21-jmxMeterRead.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO jmxMeterRead
echo error : jmxMeterRead >> automigration.log
exit /b 1
:jmxMeterRead
call 22-checkLoadMeterRead.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO checkLoadMeterReadSuccess
echo error : checkLoadMeterRead errors >> automigration.log
exit /b 1
:checkLoadMeterReadSuccess

echo start :  ConfigurationContact >> automigration.log


call 23-LoadConfigurationContact.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO LoadConfigurationContact
echo error : LoadConfigurationContact >> automigration.log
exit /b 1
:LoadConfigurationContact
call 24-jmxConfigurationContact.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO jmxConfigurationContact
echo error : jmxConfigurationContact >> automigration.log
exit /b 1
:jmxConfigurationContact
call 25-checkConfigurationContact.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO checkLoadConfigurationContactSuccess
echo error : checkLoadConfigurationContact errors >> automigration.log
exit /b 1
:checkLoadConfigurationContactSuccess

echo start :  Configuration Relation >> automigration.log


call 26-LoadConfigurationRelation.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO LoadConfigurationRelation
echo error : LoadConfigurationRelation >> automigration.log
exit /b 1
:LoadConfigurationRelation
call 27-jmxConfigurationRelation.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO jmxConfigurationRelation
echo error : jmxConfigurationRelation >> automigration.log
exit /b 1
:jmxConfigurationRelation
call 28-checkConfigurationRelation.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO checkConfigurationContactSuccess
echo error : checkLoadConfigurationRelaction errors >> automigration.log
exit /b 1
:checkConfigurationRelationSuccess

echo start : contracts >> automigration.log


call 29-Loadcontracts.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO Loadcontracts
echo error : Loadcontracts >> automigration.log
exit /b 1
:Loadcontracts
call 30-jmxContracts.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO jmxContracts
echo error : jmxContracts >> automigration.log
exit /b 1
:jmxContracts
call 31-checkLoadContract.bat >> automigration.log
if NOT ERRORLEVEL 1 GOTO checkLoadContractSuccess
echo error : checkLoadContract errors >> automigration.log
exit /b 1
:checkLoadContractSuccess

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







