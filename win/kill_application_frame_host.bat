@echo off
REM
REM kill ApplicationFrameHost.exe, which ist automatically started for example by the
REM calculator app and sometimes causes several second hangs when usimg windows
REM shortcuts (like starting a Terminal).
REM
REM This will also kill applications using it (like calculator) but that's ok with me,
REM the ApplicationFrameHost.exe will automatically get restartet on the next APP startup.
REM
REM (see also: https://superuser.com/questions/426947/slow-windows-desktop-keyboard-shortcuts)
REM

echo
echo ####################################
echo # killing ApplicationFrameHost.exe # 
echo ####################################
Taskkill /IM ApplicationFrameHost.exe /F

REM press enter to continue....
pause
