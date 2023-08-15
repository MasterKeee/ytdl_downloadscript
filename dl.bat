@echo off
setlocal enabledelayedexpansion

REM 提示用户输入下载路径
set /p "output_dir=请输入下载路径: "

REM 检查用户是否输入了下载路径
if "%output_dir%"=="" (
    echo Error: No output directory entered.
    pause
    exit /b
)

REM 创建下载路径
mkdir "%output_dir%" >nul 2>nul

REM 检查是否拖放了文件
if "%~1"=="" (
    echo Error: No file dropped onto the script.
    echo Please drag and drop a text file containing video links onto the script.
    pause
    exit /b
)

REM 读取文本文件
set "file=%~1"

REM 下载视频
for /f "usebackq delims=" %%A in ("%file%") do (
    echo Downloading: %%A
    youtube-dl --output "%output_dir%\%%(title)s.%%(ext)s" "%%A"
)

echo Download completed.
pause
