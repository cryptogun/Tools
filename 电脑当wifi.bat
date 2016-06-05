@echo off
set myID=love^ me^ like^ you^ do
set myPASSWD=12345678

:setID
set /p ISSID=请设置wifi帐号:
if %ISSID%==ditto set ISSID=%myID%
echo 新wifi帐号为：%ISSID%

:setPASSWD
set /p IKEY=请设置wifi密码:
if %IKEY%==ditto set IKEY=%myPASSWD%
echo 新wifi密码为：%IKEY%


echo 创建wifi...
netsh wlan set hostednetwork mode=allow key=%IKEY% ssid="%ISSID%"
if errorlevel 1 goto wrong
goto right

:wrong
echo ##########################################################
echo 出错。电脑没有无限网卡，或者
echo 帐号或密码错误。
echo 帐号可使用数字或字母。
echo 密码长度为8到63位，可使用数字、字母、特殊字符。
echo\
echo 请重新设置：
goto setID


:right
echo 创建完成

echo 启用wifi：%ISSID% ...
netsh wlan start hostednetwork
echo 完成。wifi：%ISSID%  密码：%IKEY% 可以连接！


pause

:ask

set /p ans=你要关闭此wifi %ISSID%吗？键入“Y”或“y”则关闭。
if %ans%==Y goto end
if %ans%==y goto end
goto ask

:end
echo this is the end.
netsh wlan stop hostednetwork
netsh wlan set hostednetwork mode=allow ssid=%ISSID% key=ahseirghiASDUBFG13458@
netsh wlan stop hostednetwork
rem netsh wlan set hostednetwork mode=disallow
echo wifi已关闭。
pause
exit
