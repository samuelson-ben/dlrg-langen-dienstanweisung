@echo off
setlocal enabledelayedexpansion

:: Check if keeppdf is passed as a parameter
set keeppdf=false
if "%1"=="keeppdf" set keeppdf=true

:: Open delete_list.txt and read each line
for /f "delims=" %%F in (delete_list.txt) do (
    set filename=%%F

    :: Check if the file extension is .pdf and keeppdf is true
    if !keeppdf! == true (
        echo Checking file: !filename!
        set extension=!filename:~-4!
        if /i "!extension!"==".pdf" (
            echo Skipping PDF file: !filename!
        ) else (
            echo Deleting file: !filename!
            del "%%F"
        )
    ) else (
        echo Deleting file: !filename!
        del "%%F"
    )
)

endlocal
