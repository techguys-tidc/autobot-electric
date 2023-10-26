@echo on
SET UI_ROBOT_PATH="C:\Users\Autobot\AppData\Local\Programs\UiPath\Studio\UiRobot.exe"
SET FILE_EXEC="C:\Users\Autobot\Desktop\Autobot\WebCTRL\Autobot.1.0.19.nupkg"

%UI_ROBOT_PATH% -file %FILE_EXEC% 
exit