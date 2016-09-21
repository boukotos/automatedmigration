@echo off
IF [%1]==[] GOTO usage

SC query %1 | FIND "STATE" 
IF errorlevel 1 GOTO SystemOffline

:ResolveInitialState
SC query %1 | FIND "STATE" | FIND "STOPPED" 
IF errorlevel 0 IF NOT errorlevel 1 GOTO StartService
SC query %1 | FIND "STATE" | FIND "RUNNING" 
IF errorlevel 0 IF NOT errorlevel 1 GOTO StartedService
SC query %1 | FIND "STATE" | FIND "PAUSED" 
IF errorlevel 0 IF NOT errorlevel 1 GOTO SystemOffline
echo Service State is changing, waiting for service to resolve its state before making changes
sc query %1 | Find "STATE"
PING -n 3 127.0.0.1
GOTO ResolveInitialState

:StartService
echo Starting %1
sc start %1

GOTO StartingService
:StartingServiceDelay
echo Waiting for %1 to start
PING -n 11 127.0.0.1
:StartingService
SC query %1 | FIND "STATE" | FIND "RUNNING" 
IF not errorlevel 1 GOTO StartedService
rem SC query %1 | FIND "STATE" | FIND "START_PENDING" 
GOTO StartingService

:StartedService
echo %1 is started
GOTO:eof

:SystemOffline
echo is offline
GOTO:eof

:couldnotstart
echo service %1 could not start
exit /b %errorlevel%
GOTO eof


:usage
echo %0 [system name] [service name]
echo Example: %0 server1 MyService
echo.
GOTO:eof
exit 