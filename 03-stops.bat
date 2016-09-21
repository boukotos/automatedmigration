@echo off
IF [%1]==[] GOTO usage

SC query %1 | FIND "STATE" 
IF errorlevel 1 GOTO SystemOffline

:ResolveInitialState
SC query %1 | FIND "STATE" | FIND "RUNNING" 
IF errorlevel 0 IF NOT errorlevel 1 GOTO StopService
SC query %1 | FIND "STATE" | FIND "STOPPED" 
IF errorlevel 0 IF NOT errorlevel 1 GOTO StoppedService
SC query %1 | FIND "STATE" | FIND "PAUSED" 
IF errorlevel 0 IF NOT errorlevel 1 GOTO SystemOffline
echo Service State is changing, waiting for service to resolve its state before making changes
sc query %1 | Find "STATE"
PING -n 3 127.0.0.1
GOTO ResolveInitialState

:StopService
echo Stopping %1
sc stop %1

:StoppingServiceDelay
echo Waiting for %1 to stop
PING -n 41 127.0.0.1
:StopingService
SC query %1 | FIND "STATE" | FIND "STOPPED" 
IF not errorlevel 1 GOTO StoppedService
GOTO StoppingServiceDelay


:couldnotstop
echo service %1 could not stop
exit /b %errorlevel%
GOTO eof

:StoppedService
echo %1 is stopped
GOTO:eof

:SystemOffline
echo Server service %1 is not accessible or is offline
GOTO:eof

:usage
echo Will cause a remote service to STOP (if not already stopped).
echo This script will waiting for the service to enter the stopped state if necessary.
echo.
echo %0 [system name] [service name] {reason}
echo Example: %0 server1 MyService
echo.
echo For reason codes, run "sc stop"
GOTO:eof