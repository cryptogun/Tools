@if (@X)==(@Y) @end /* Harmless hybrid line that begins a JScript comment
::Above fix the err: Microsoft JScript: Conditional Compilation is off

::here goes the batch command:
@echo off
rem 笔记保存路径：↓↓↓↓↓↓
set directory=d:\dairy
rem           ↑↑↑↑↑↑↑↑


set fileName=%directory%\%date:~0,4%年%date:~5,2%月%date:~8,2%日%date:~11,3%.txt
set dd=%date:~8,2%
set mm=%date:~5,2%
set yy=%date:~0,4%
set Tss=%TIME:~6,2%
set Tmm=%TIME:~3,2%
set Thh=%TIME:~0,2%
set Thh=%Thh: =0%
set tip=%Thh%:%Tmm%----------------------------------------------------------------------------
(echo.)>>%fileName% 
echo %tip%>>%fileName% 
start %fileName%
if errorlevel 1 goto error
goto move_to_end_of_txt_file


:error
echo 如提示找不到路径，请到bat程序内修改路径为你希望的保存路径。
pause
goto end



:move_to_end_of_txt_file
:: At any point you can execute the following to access your JScript
::cscript //E:JScript //nologo "%~f0" yourJscriptParametersGoHere
set SendKeys=CScript //nologo //E:JScript "%~F0"
%SendKeys% "^{END}"


:end
:: Be sure to terminate your script so that 
:: it does not fall through into the JScript code
exit /b

********* Begin JScript code **********/
var WshShell=WScript.CreateObject("WScript.Shell")
WshShell.SendKeys(WScript.Arguments(0));
/* do whatever with your WshShell object */