@echo off
title XAMPP MySQL Backup

set "MYSQLBIN=C:\xampp\mysql\bin"
set "BACKUPDIR=C:\xampp\mysql_backups"

if not exist "%BACKUPDIR%" mkdir "%BACKUPDIR%"

for /f "tokens=1-3 delims=/" %%a in ("%date%") do (
    set "DATE=%%c-%%a-%%b"
)

set "BACKUPFILE=%BACKUPDIR%\MySQL_Backup_%DATE%.sql"

echo.
echo ==========================================
echo       XAMPP MYSQL DATABASE BACKUP
echo ==========================================
echo.
echo Backing up all databases...
echo.

"%MYSQLBIN%\mysqldump.exe" -u root --all-databases --routines --events --triggers > "%BACKUPFILE%"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo BACKUP COMPLETED SUCCESSFULLY!
    echo.
    echo File:
    echo %BACKUPFILE%
) else (
    echo.
    echo BACKUP FAILED!
    echo Please make sure MySQL is running in XAMPP.
)

echo.
pause