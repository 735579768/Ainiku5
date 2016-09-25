@echo off
echo simple php server
@for /f "tokens=4" %%a in ('route print^|findstr 0.0.0.0.*0.0.0.0') do (
 set IP=%%a
)

@echo off
taskkill /f /im QuickPHP.exe
start http://%IP%:8989/index.php
start QuickPHP.exe /port=8989 /Minimized /ShowTrayIcon=true /Bind="%IP%" /AllowDirList=true /Root="%cd%/../" /DefaultDoc="index.php,index.html" /Start