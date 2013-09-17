@echo off
rem APMaker v1 2013-09-16
cls
rem Source: http://www.network-science.de/ascii/
echo "------------------------------------------------------------"
echo " ______  ____                       __                      "
echo "/\  _  \/\  _`\   /'\_/`\          /\ \                     "
echo "\ \ \L\ \ \ \L\ \/\      \     __  \ \ \/'\      __   _ __  "
echo " \ \  __ \ \ ,__/\ \ \__\ \  /'__`\ \ \ , <    /'__`\/\`'__\"
echo "  \ \ \/\ \ \ \/  \ \ \_/\ \/\ \L\.\_\ \ \\`\ /\  __/\ \ \/ "
echo "   \ \_\ \_\ \_\   \ \_\\ \_\ \__/.\_\\ \_\ \_\ \____\\ \_\ "
echo "    \/_/\/_/\/_/    \/_/ \/_/\/__/\/_/ \/_/\/_/\/____/ \/_/ "
echo "------------------------------------------------------------"
echo.

rem Source:http://stackoverflow.com/questions/4051883/batch-script-how-to-check-for-admin-rights
NET SESSION >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo Admin Rights Detected!
	echo.
) else (
	echo Please restart your CMD.exe with Admin Rights!
	goto:eof
)


IF [%1] == [] (
	echo You did NOT include an SSID entry!
	echo.
	echo Usage: APMaker.bat ^<SSID^> ^<Password^>
	goto:eof
)
rem ) ELSE (
rem 	echo There was an entry!
rem 	echo %1
rem )

IF [%2] == [] (
	echo You did NOT include an Password entry!
	echo.
	echo Usage: APMaker.bat ^<SSID^> ^<Password^>
	goto:eof
)

echo Checking Network Support:
netsh wlan show drivers | findstr /R /C:"Hosted network supported"
netsh wlan show drivers | findstr /R /C:"Hosted network supported" > tmpFile
set /p Temp= < tmpFile
rem Parse through ALL words to see if Yes exists; Think of this as a shift to the end operation
for %%A in (%Temp%) do set Value=%%A
del tmpFile

IF "%Value%" == "No" (
	echo.
	echo    Windows says you CAN'T run a hostednetwork :^(
	echo    go see what Google says...
	goto:eof)
echo.

echo Creating Network: ^'%1^' with password ^'%2^'

netsh wlan set hostednetwork mode=allow ssid=%1 key=%2
netsh wlan start hostednetwork


rem Good To Know:
rem -------------

rem Parse entries with slashes, save last variable:
rem set filePath=%1
rem set filePath=%filePath:\= %
rem for %%A in (%filePath%) do set last=%%A

rem Can't start hostednetwork
rem http://blogs.msdn.com/b/timart/archive/2013/01/27/netsh-wlan-start-hostednetwork-the-hosted-network-couldn-t-be-started.aspx