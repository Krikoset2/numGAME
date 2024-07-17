@echo off
setlocal enabledelayedexpansion

:start_game
cls
color 0E
echo  __   __  __  __  __    __  ______  ______  __    __  ______    
echo /\ "-.\ \/\ \/\ \/\ "-./  \/\  ___\/\  __ \/\ "-./  \/\  ___\   
echo \ \ \-.  \ \ \_\ \ \ \-./\ \ \ \__ \ \  __ \ \ \-./\ \ \  __\   
echo  \ \_\\"\_\ \_____\ \_\ \ \_\ \_____\ \_\ \_\ \_\ \ \_\ \_____\ 
echo   \/_/ \/_/\/_____/\/_/  \/_/\/_____/\/_/\/_/\/_/  \/_/\/_____/
echo.

set /a min=1
set /a max=100
set /a target=%random% %% (%max% - %min% + 1) + %min%
set /a proby=0

echo Liczba jest pomiedzy %min% a %max%.
echo.

:petla_zgadywania
set /a proby+=1
set /p "zgadnij=Twoja liczba: "

echo %zgadnij%| findstr /r "^[1-9][0-9]*$" >nul
if %errorlevel% neq 0 (
    color 0C
    echo Prosze podac prawidlowa liczbe.
    color 0E
    goto petla_zgadywania
)

if %zgadnij% lss %target% (
    color 09
    echo Wieksza.
    color 0E
) else if %zgadnij% gtr %target% (
    color 0D
    echo Mniejsza.
    color 0E
) else (
    color 0A
    echo Gratulacje! Zgadles liczbe %target%!
    echo Zajelo Ci to %proby% prob.
    goto koniec_gry
)
echo.
goto petla_zgadywania

:koniec_gry
echo.
echo Dziekuje za gre!
echo.

:pytanie_o_ponowna_gre
set /p "zagraj_ponownie=Czy chcesz zagrac jeszcze raz? (Y/N): "
if /i "%zagraj_ponownie%"=="Y" goto start_game
if /i "%zagraj_ponownie%"=="N" goto koniec_programu
echo Nieprawidlowa odpowiedz. Prosze wpisac Y lub N.
goto pytanie_o_ponowna_gre

:koniec_programu
cls
color 0E
echo  __  __  ______  __   __  __  ______  ______    
echo /\ \/ / /\  __ \/\ "-.\ \/\ \/\  ___\/\  ___\   
echo \ \  _"-\ \ \/\ \ \ \-.  \ \ \ \  __\\ \ \____  
echo  \ \_\ \_\ \_____\ \_\\"\_\ \_\ \_____\ \_____\ 
echo   \/_/\/_/\/_____/\/_/ \/_/\/_/\/_____/\/_____/ 
echo.
echo Dziekujemy za granie!
echo Do widzenia!
pause