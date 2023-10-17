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

::@Community-Online-Tools;
::-mod=@AdvancedBanking;@Airdrop-Upgraded;@AntiContainerStacking;@ArrakisTraderSigns;@BaseBuildingPlus;@BasicSpawnSelect;@BBPItemPack;@Better Inspect;@BuilderItems;@BuildEverywhere;@CannabisPlus;@CARs;@Collectable Items;@Creatures Of The Night;@DayZ Editor Loader;@DNA Keycards;@DrugsPLUS;@Erapulsar_Zombies;@FS(FIDOvSTALKER);@Forward Operator Gear;@gebsfish;@LIGHTS;@LoftDModGR Clothes Pack;@MagazineLoading;@MMG - Mightys Military Gear;@MMG Base Storage;@MuchCarKey;@MuchStuffPack;@No Glove Or Shoe Damage;@PokemonAlbum;@PristineRepair;@PvZmoD_CustomisableZombies;@Quadlock's Pack;@RedFalcon Flight System Heliz;@DayZ-Expansion-Core;@DayZ-Expansion-Navigation;@DayZ-Expansion-Book;@DayZ-Expansion-Groups;@SNAFU Weapons;@Radio;@Crocos Quadbike;@BulletStacksPlusPlus;@DayZ-Dog;@WindstridesClothingPack;@RaG_Liquid_Framework;@RaG_BeeHive;@CBD Halo Armour;@Solar Panel Power System;@RevGuns;@StaticBaseEFWeb;@SpawnerBubaku;@Velha_Guarda_PVE_Chernarus;@Z_Predator;@Z_Alien

::@Basic Territories
::@Code Lock
::@FlipTransport
::@Garage
::@Trader
::@TraderFixesAndFeatures
::@PVEZ Reloaded
::@BetterVendingMachines
::-mod=@CF;@Dabs Framework;@VPPAdminTools;@AC-Mod-Pack;@Velha_Guarda_Chernarus;@Basic Territories

start DayZServer_x64.exe -config=serverDZ.cfg -port=2302 -profiles=ServerProfile "-mod=@CF;@Dabs Framework;@VPPAdminTools;@AC-Mod-Pack;@Velha_Guarda_Chernarus;@Basic Territories" -cpuCount=4 -dologs -adminlog -netlog -freezecheck
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