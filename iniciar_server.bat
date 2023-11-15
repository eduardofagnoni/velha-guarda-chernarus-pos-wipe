@ECHO OFF
COLOR 2

SET RESTART_TIMEOUT=0

ECHO [INFO] Iniciando Servidor

TITLE  SERVIDOR INICIADO

:LOOP
tasklist /FI "IMAGENAME eq DayZServer_x64.exe" 2>NUL | find /I /N "DayZServer_x64.exe">NUL
::Tasklist /NH /FI "imagename eq DayZServer_x64.exe" 2>nul |find /i "DayZServer_x64.exe" >nul
::If not errorlevel 1 (Echo "sd" is running !) else (Echo "sds" is running !)
IF %ERRORLEVEL% == 0 GOTO LOOP
SET /a LOOPS=0

:: ver e incluir
::@Community-Online-Tools; - 1mb
::Easy Signs [by Cl0ud] - 4mb
::WindstridesClothingPack - 750mb
::MoreDayZ - 336mb
::Trolley Kopter - 12mb
::Underground Bases - 247mb - ok
::PowerPoleLight - 0,035mb - ok
:: Trader Plus - 173mb - ok

:: retirados
::@Garage - 27mb
::@GarageFix - 1mb
::@Trader - 11mb
::@TraderFixesAndFeatures - 1mb

<<<<<<< HEAD
start DayZServer_x64.exe -config=serverDZ.cfg -port=2302 -profiles=ServerProfile "-mod=@CF;@Dabs Framework;@DayZ Editor Loader;@VPPAdminTools;@AC-Mod-Pack;@AdvancedBanking;@Velha_Guarda_Chernarus;@ABFix;@Basic Territories;@BurningBarrels;@FlipTransport;@Garage;@GarageFix;@Trader;@TraderFixesAndFeatures;@VanillaPlusPlusMap;@PVEZ Reloaded;@PVEZMarkersOnVPPMap;@BetterVendingMachines;@LIGHTS;@Code Lock;@MuchStuffPack;@BuilderItems;@Care Packages;@BR ARMY CLOTHING;@SpawnerBubaku;@SchanaModParty" -cpuCount=4 -dologs -adminlog -netlog -freezecheck
=======
start DayZServer_x64.exe -config=serverDZ.cfg -port=2302 -profiles=ServerProfile "-mod=@CF;@Dabs Framework;@DayZ Editor Loader;@VPPAdminTools;@AC-Mod-Pack;@Velha_Guarda_Chernarus;@AdvancedBanking V2;@Basic Territories;@BurningBarrels;@FlipTransport;@TraderPlus;@VanillaPlusPlusMap;@PVEZ Reloaded;@PVEZMarkersOnVPPMap;@BetterVendingMachines;@LIGHTS;@Code Lock;@MuchStuffPack;@BuilderItems;@Care Packages;@BR ARMY CLOTHING;@SpawnerBubaku;@SchanaModParty;@dodge_rust_Z_radash;@PowerPoleLight;@Underground Bases;@TraderPlus_Disable_DeployVehicles" -cpuCount=4 -dologs -adminlog -netlog -freezecheck
>>>>>>> 7ceaf7a07d98253696f20cceafcd20a1a421300c
ECHO [INFO] Servidor Iniciado em: %DATE%, %TIME%
SET data2="%DATE%"
SET time2="%TIME%"
ECHO [INFO] Para parar o servidor, Feche esta janela e depois as outras tarefas, se nao so ira reiniciar!

IF %RESTART_TIMEOUT%==0 (
  GOTO RESTART_SKIP
)

TIMEOUT %RESTART_TIMEOUT%
TASKKILL /im DayZServer_x64.exe /F
::TASKKILL /im DZSALModServer.exe /F

:RESTART_SKIP
TIMEOUT 5
ECHO.

:: Restart/Crash Handler
:LOOPING
SET /A LOOPS+=1
CLS
ECHO [INFO] Servidor Iniciado em: %data2%, %time2%
ECHO [INFO] Para parar o servidor, Feche esta janela e depois as outras tarefas, se nao so ira reiniciar!
ECHO.
ECHO [CHECK SERVER ON] %LOOPS% Verificacoes
TIMEOUT /t 5
tasklist /FI "IMAGENAME eq DayZServer_x64.exe" 2>NUL | find /I /N "DayZServer_x64.exe">NUL

ECHO %ERRORLEVEL%
IF %ERRORLEVEL%==0 GOTO LOOPING
GOTO LOOP

:: Generic config error catching
:CONFIG_ERROR
COLOR C
ECHO ERRO: %ERROR% nao foi setado corretamente, cheque o script
PAUSE
COLOR 2