@echo off
:: ===================================================
:: Skripta za ciscenje TEMP foldera - by timyx
:: Verzija: 1.0
:: Datum: 2025
:: ===================================================

setlocal enabledelayedexpansion

:: Postavi varijable
set "temp_folder=%TEMP%"
set "broj_obrisanih=0"
set "broj_gresaka=0"

:: Pozdravna poruka
echo.
echo ========================================
echo   TIMYX TEMP CLEANER - Verzija 1.0
echo ========================================
echo.
echo Pozdrav! Ova skripta ce obrisati sve
echo fajlove i foldere iz vaseg TEMP foldera.
echo.
echo Temp folder lokacija: %temp_folder%
echo.

:: Provjeri da li temp folder postoji
if not exist "%temp_folder%" (
    echo GRESKA: Temp folder ne postoji!
    pause
    exit /b 1
)

:: Upozorenje i potvrda
echo PAZNJA: Svi fajlovi u TEMP folderu ce biti obrisani!
echo.
set /p "potvrda=Da li zelite nastaviti? (da/ne): "

if /i not "%potvrda%"=="da" (
    echo.
    echo Operacija otkazana od strane korisnika.
    echo Hvala sto koristite timyx cleaner!
    pause
    exit /b 0
)

echo.
echo Pocinje brisanje fajlova...
echo.

:: Idi u temp folder
cd /d "%temp_folder%" 2>nul
if errorlevel 1 (
    echo GRESKA: Ne mogu pristupiti temp folderu!
    pause
    exit /b 1
)

:: Brisi sve fajlove
echo Brisem fajlove...
for %%f in (*.*) do (
    del "%%f" /f /q >nul 2>&1
    if not errorlevel 1 (
        set /a broj_obrisanih+=1
        echo   - Obrisan fajl: %%f
    ) else (
        set /a broj_gresaka+=1
        echo   - GRESKA pri brisanju: %%f
    )
)

:: Brisi sve foldere
echo.
echo Brisem foldere...
for /d %%d in (*) do (
    rmdir "%%d" /s /q >nul 2>&1
    if not errorlevel 1 (
        set /a broj_obrisanih+=1
        echo   - Obrisan folder: %%d
    ) else (
        set /a broj_gresaka+=1
        echo   - GRESKA pri brisanju foldera: %%d
    )
)

:: Prikazi rezultate
echo.
echo ========================================
echo           REZULTATI CISCENJA
echo ========================================
echo.
echo Ukupno obrisanih stavki: %broj_obrisanih%
echo Broj gresaka: %broj_gresaka%
echo.

if %broj_gresaka% gtr 0 (
    echo NAPOMENA: Neki fajlovi/folderi nisu obrisani
    echo jer su mozda u upotrebi od strane sistema
    echo ili drugih programa.
) else (
    echo Sve stavke su uspjesno obrisane!
)

echo.
echo Temp folder je ociscen!
echo Hvala sto koristite timyx cleaner!
echo.

:: Zavrsi
pause
exit /b 0