@echo off
setlocal enabledelayedexpansion

set "PACK_DIR=%~dp0"
if "%PACK_DIR:~-1%"=="\" set "PACK_DIR=%PACK_DIR:~0,-1%"

if not exist .GAME_DIR (
    set /p GAME_DIR=Type path to game dir: 
    for %%I in ("%GAME_DIR%") do set "GAME_DIR=%%~fI"

    if not exist "%GAME_DIR%\mods" (
        echo Could not find %GAME_DIR%\mods
        exit /b 1
    )
    echo %GAME_DIR% > .GAME_DIR
) else (
    set /p GAME_DIR=<.GAME_DIR
)

cd /d "%GAME_DIR%"

packwiz-installer -g -s both "%PACK_DIR%\pack\pack.toml"

echo Mods updated!
