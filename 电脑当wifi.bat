@echo off
set myID=love^ me^ like^ you^ do
set myPASSWD=12345678

:setID
set /p ISSID=������wifi�ʺ�:
if %ISSID%==ditto set ISSID=%myID%
echo ��wifi�ʺ�Ϊ��%ISSID%

:setPASSWD
set /p IKEY=������wifi����:
if %IKEY%==ditto set IKEY=%myPASSWD%
echo ��wifi����Ϊ��%IKEY%


echo ����wifi...
netsh wlan set hostednetwork mode=allow key=%IKEY% ssid="%ISSID%"
if errorlevel 1 goto wrong
goto right

:wrong
echo ##########################################################
echo ��������û����������������
echo �ʺŻ��������
echo �ʺſ�ʹ�����ֻ���ĸ��
echo ���볤��Ϊ8��63λ����ʹ�����֡���ĸ�������ַ���
echo\
echo ���������ã�
goto setID


:right
echo �������

echo ����wifi��%ISSID% ...
netsh wlan start hostednetwork
echo ��ɡ�wifi��%ISSID%  ���룺%IKEY% �������ӣ�


pause

:ask

set /p ans=��Ҫ�رմ�wifi %ISSID%�𣿼��롰Y����y����رա�
if %ans%==Y goto end
if %ans%==y goto end
goto ask

:end
echo this is the end.
netsh wlan stop hostednetwork
netsh wlan set hostednetwork mode=allow ssid=%ISSID% key=ahseirghiASDUBFG13458@
netsh wlan stop hostednetwork
rem netsh wlan set hostednetwork mode=disallow
echo wifi�ѹرա�
pause
exit
