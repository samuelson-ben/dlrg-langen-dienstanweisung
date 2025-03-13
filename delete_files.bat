@echo off
setlocal enabledelayedexpansion

:: Verzeichnis, aus dem die Dateien gelöscht werden sollen
set "TARGET_DIR=."

:: Datei mit der Liste der zu löschenden Dateien
set "LIST_FILE=delete_list.txt"

:: Überprüfen, ob die Liste existiert
if not exist "%LIST_FILE%" (
    echo Die Datei %LIST_FILE% existiert nicht!
    exit /b
)

:: Prüfen, ob das Argument "keeppdf" übergeben wurde
set "KEEP_PDF=false"
if /I "%1"=="keeppdf" set "KEEP_PDF=true"

:: Dateien aus der Liste löschen
for /f "delims=" %%f in (%LIST_FILE%) do (
    set "FILE_PATH=%TARGET_DIR%\%%f"
    if /I "!KEEP_PDF!"=="true" if /I "%%~xf"==".pdf" (
        echo Übersprungen (PDF): %%f
        goto :continue
    )
    
    if exist "!FILE_PATH!" (
        del "!FILE_PATH!"
        echo Gelöscht: %%f
    ) else (
        echo Nicht gefunden: %%f
    )
    
    :continue
)

endlocal