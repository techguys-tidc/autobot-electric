@echo on
setlocal

:: Get current date
for /f %%a in ('powershell -command "Get-Date -Format 'yyyy-MM-dd'"') do set CURRENT_DATE=%%a
:: Get yesterday's date
for /f %%a in ('powershell -command "Get-Date (Get-Date).AddDays(-1) -Format 'yyyy-MM-dd'"') do set YESTERDAY_DATE=%%a

SET ACCESS_KEY_ID=TVUSTVS13PZ4T9QRFPU2 
SET SECRET_ACCESS_KEY=1NTfgrYt2WUVJR0Qw5IJeSCus9Efn241wsFhRs4p  
SET ENDPOINT=https://obs.ap-southeast-214.clouds.trueidc.com
SET BUCKET=obs://demo-electric-automation-billing/
SET UPLOAD_FOLDER=C:\Users\Autobot\Downloads\Autobot\
SET MAIN_PATH=schedule/
SET DC=MTG/
SET PROGRAM=WebCTRL/

set NEW_PATH=%BUCKET%%MAIN_PATH%%DC%%PROGRAM%%CURRENT_DATE%
set OLD_PATH=%BUCKET%%MAIN_PATH%%DC%%PROGRAM%%YESTERDAY_DATE%

obsutil config -i=%ACCESS_KEY_ID% -k=%SECRET_ACCESS_KEY% -e=%ENDPOINT%

obsutil mkdir %NEW_PATH%

obsutil cp %UPLOAD_FOLDER% %NEW_PATH% -r -f -flat

obsutil rm %OLD_PATH% -r -f

rmdir /S /q %UPLOAD_FOLDER%

endlocal