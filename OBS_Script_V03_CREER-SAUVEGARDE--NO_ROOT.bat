:: PREMABULE
::
:: Le script ajoute la date au nom de l'archive + le nom courant de l'utilisateur == variables WINDOWS %USERNAME%	{username}

:: <---- DATE --->
:: Pour la date 2 méthodes
:: a) Ecrire directement la date dans le nom complet du fichier
:: b) Créer une variable

:: a) Méthode directe :
:: EXEMPLE VOIR PLUS BAS
:: %date:~6,4%-%date:~3,2%-%date:~0,2%

:: b) Méthode par variable
:: EXEMPLE
:: Date alternative
:: set madate=%date:~6,4%-%date:~3,2%-%date:~0,2%

::
::                     ATTENTION
::
::     CE SCRIPT NE FONCTIONNE PAS EN RESEAU
::
::     LE SCRIPT PROPOSE LE CHOIX DE LA SAUVEGARDE
::              DANS LE REPERTOIRE NORMALISÉ ( par défaut )
::              OU LOCALE ( Pour une clef USB par exemple )
::
::                     ATTENTION
::
::
::
::
:: ---------  ELEVATION DES PRIVILEGES : ON PASSE EN MODE ADMIN POUR POUVOIR LIRE DANS --programfiles--
::
:: L'elevation des privileges est supprimee !!
::
:: Il faut executer le script en **MODE ADMIN**
::
:: Bouton droit de la souris "Executer en tant qu'Administrateur"
::
:: Des versions suivantes permettrons d'elever les privileges et d'executer directement le script
::
:: Ce script est en version ZERO  V0.3
::
:: ---------  FIN DU MODE ADMIN
::

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

@echo OFF
echo *********************************
echo DEBUT
echo *********************************

:: Initialisation de la date
echo Initialisation de la date
set madate=%date:~6,4%-%date:~3,2%-%date:~0,2%

:CHOIX
:: On demande de choisir entre Local / Normalisation
@echo OFF
echo  .
echo  .
echo  .
echo #################
echo SAUVEGARDE
echo .
echo !! ATTENTION !!
echo "La Sauvegarde LOCALE se fera dans le meme repertoire que ce script --> %~dp0"
echo .
echo Par defaut la sauvegarde s'effectue dans le repertroire normalise !
echo "Le repertoire sous sa forme NORMALISEE se situe dans -> %USERPROFILE%\Documents\OBS_KIT-PACK\_SAUVEGARDES"

echo #################
@echo OFF
SET /P SAUVE=Vous voulez faire une sauvegarde NORMALISEE (par defaut) [N]/(L) ? Ou une Sauvegarde LOCALE (L) __
IF /I "%SAUVE%" NEQ "L" GOTO NORMALISEE

:LOCALE
@echo OFF
echo .
echo SAUVEGARDE LOCALE
echo .
echo "Sauvegarde fichier OBS Systeme dans une archive LOCALE dans le repertoire -> %~dp0"
7z a -t7z -mx=9 SAUVEGARDE_OBS-Logiciel-Plugins-%username%-%madate%.7z "%PROGRAMFILES%\obs-studio"
echo "Sauvegarde Preferences Utilisateur  dans une archive LOCALE dans le repertoire -> %~dp0"
7z a -t7z -mx=9 SAUVEGARDE_OBS-Mes-Preferences-%username%-%madate%.7z "%APPDATA%\obs-studio" -xr!*logs* -xr!*Cache* -xr!*crashes* -xr!*obs_profile_cookies* -xr!*_SAUVEGARDES*
echo .
echo FAIT
echo .
GOTO FIN
:::::::

:NORMALISEE
@echo OFF
echo .
echo SAUVEGARDE NORMALISEE
echo .
echo "Sauvegarde fichier OBS Systeme dans le repertoire normalise dans le repertoire -> %USERPROFILE%\Documents\OBS_KIT-PACK\_SAUVEGARDES"
7z a -t7z -mx=9 "%USERPROFILE%\Documents\OBS_KIT-PACK\_SAUVEGARDES\SAUVEGARDE_OBS-Logiciel-Plugins-%username%-%madate%.7z" "%PROGRAMFILES%\obs-studio"
echo "Sauvegarde Preferences Utilisateur dans le repertoire normalise dans le repertoire -> %USERPROFILE%\Documents\OBS_KIT-PACK\_SAUVEGARDES"
7z a -t7z -mx=9 "%USERPROFILE%\Documents\OBS_KIT-PACK\_SAUVEGARDES\SAUVEGARDE_OBS-Mes-Preferences-%username%-%madate%.7z" "%APPDATA%\obs-studio" -xr!*logs* -xr!*Cache* -xr!*crashes* -xr!*obs_profile_cookies* -xr!*_SAUVEGARDES*
echo .
echo FAIT
echo .
GOTO FIN
:::::::

:FIN
@echo OFF
echo *********************************
echo GG
echo *********************************

@echo OFF
SET /P ETESVOUSUR=Bravo felicitation c'est fini -- APPUYEZ SUR UNE TOUCHE POUR FINIR
IF /I "%ETESVOUSUR%" NEQ "O" GOTO FINITO
echo .
:: FINITO
exit

:: ---------------------------  SAUVEGARDE PROFIL UTILISATEUR
:: SAUVEGARDE DE FICHIERS 7z
:: PAR DATE DIRECTE
:: 7z a -t7z -mx=9 SAUVEGARDES_OBS-Mes-Preferences-%username%-%date:~6,4%-%date:~3,2%-%date:~0,2%.7z "%APPDATA%\obs-studio" -xr!*logs* -xr!*Cache* -xr!*crashes* -xr!*obs_profile_cookies* -xr!*_SAUVEGARDES*
:: PAR DATE EN VARIABLE
:: 7z a -t7z -mx=9 %USERPROFILE%\Documents\OBS_KIT-PACK\_SAUVEGARDES\SAUVEGARDE_OBS-Mes-Preferences-%username%-%madate%.7z "%APPDATA%\obs-studio" -xr!*logs* -xr!*Cache* -xr!*crashes* -xr!*obs_profile_cookies* -xr!*_SAUVEGARDES*

:: SAUVEGARDE DE FICHIERS .exe "self-extract"
:: AUTOMATIQUE DANS LE REPERTOIRE COURANT SANS INTERVENTION UTILISATEUR
:: PAR DATE DIRECTE
:: 7z a -sfx -t7z -mx=9 %USERPROFILE%\Documents\OBS_KIT-PACK\_SAUVEGARDES\SAUVEGARDE_OBS-Mes-Preferences-%username%-%date:~6,4%-%date:~3,2%-%date:~0,2%.exe "%APPDATA%\obs-studio" -xr!*logs* -xr!*Cache* -xr!*crashes* -xr!*obs_profile_cookies* -xr!*_SAUVEGARDES*
:: PAR DATE EN VARIABLE
:: 7z a -sfx -t7z -mx=9 %USERPROFILE%\Documents\OBS_KIT-PACK\_SAUVEGARDES\SAUVEGARDE_OBS-Mes-Preferences-%username%-%madate%.exe "%APPDATA%\obs-studio" -xr!*logs* -xr!*Cache* -xr!*crashes* -xr!*obs_profile_cookies* -xr!*_SAUVEGARDES*

:: SAUVEGARDE DE FICHIERS 7z .exe "self-extract"
:: OUVRE UNE FENETRE WINDOWS + PATH  ET DEMANDE L'INTERVENTION DE L'UTILISATEUR
:: PERMET DE CHANGER LE CHEMIN POUR EXTRAIRE L'ARCHIVE
:: PAR DATE DIRECTE
:: 7z a -sfx7z.sfx -t7z -mx=9 %USERPROFILE%\Documents\OBS_KIT-PACK\_SAUVEGARDES\SAUVEGARDE_OBS-Mes-Preferences-%username%-%date:~6,4%-%date:~3,2%-%date:~0,2%.exe "%APPDATA%\obs-studio" -xr!*logs* -xr!*Cache* -xr!*crashes* -xr!*obs_profile_cookies* -xr!*_SAUVEGARDES*
:: PAR DATE EN VARIABLE
:: 7z a -sfx7z.sfx -t7z -mx=9 %USERPROFILE%\Documents\OBS_KIT-PACK\_SAUVEGARDES\SAUVEGARDE_OBS-Mes-Preferences-%username%-%madate%.exe "%APPDATA%\obs-studio" -xr!*logs* -xr!*Cache* -xr!*crashes* -xr!*obs_profile_cookies* -xr!*_SAUVEGARDES*


:: ---------------------------  SAUVEGARDE LOGICIEL OBS : c:\program files*
:: IMPORTANT NOTE
:: DE VIELLES VERSION DE OBS s'installent dans "X86" : "%PROGRAMFILES(X86)%	"C:\Program Files (x86)
:: LE REPERTOIRE D'USAGE EST : "%PROGRAMFILES%	C:\Program Files\obs-studio"

:: SAUVEGARDE DE FICHIERS 7z
:: PAR DATE DIRECTE
:: 7z a -t7z -mx=9 7z a -t7z -mx=9 %USERPROFILE%\Documents\OBS_KIT-PACK\_SAUVEGARDES\SAUVEGARDE_OBS-Logiciel-Plugins-%username%-%date:~6,4%-%date:~3,2%-%date:~0,2%.7z "%PROGRAMFILES%"
:: PAR DATE EN VARIABLE
:: 7z a -t7z -mx=9 %USERPROFILE%\Documents\OBS_KIT-PACK\_SAUVEGARDES\SAUVEGARDE_OBS-Logiciel-Plugins-%username%-%madate%.7z "%PROGRAMFILES%"

:: SAUVEGARDE DE FICHIERS .exe "self-extract"
:: AUTOMATIQUE DANS LE REPERTOIRE COURANT SANS INTERVENTION UTILISATEUR
:: PAR DATE DIRECTE
:: 7z a -sfx -t7z -mx=9 7z a -t7z -mx=9 %USERPROFILE%\Documents\OBS_KIT-PACK\_SAUVEGARDES\SAUVEGARDE_OBS-Logiciel-Plugins-%username%-%date:~6,4%-%date:~3,2%-%date:~0,2%.exe "%PROGRAMFILES%"
:: PAR DATE EN VARIABLE
:: 7z a -sfx -t7z -mx=9 %USERPROFILE%\Documents\OBS_KIT-PACK\_SAUVEGARDES\SAUVEGARDE_OBS-Logiciel-Plugins-%username%-%madate%.exe "%PROGRAMFILES%"

:: SAUVEGARDE DE FICHIERS 7z .exe "self-extract"
:: OUVRE UNE FENETRE WINDOWS + PATH  ET DEMANDE L'INTERVENTION DE L'UTILISATEUR
:: PERMET DE CHANGER LE CHEMIN POUR EXTRAIRE L'ARCHIVE
:: PAR DATE DIRECTE
:: 7z a -sfx7.sfx -t7z -mx=9 7z a -t7z -mx=9 %USERPROFILE%\Documents\OBS_KIT-PACK\_SAUVEGARDES\SAUVEGARDE_OBS-Logiciel-Plugins-%username%-%date:~6,4%-%date:~3,2%-%date:~0,2%.exe "%PROGRAMFILES%"
:: PAR DATE EN VARIABLE
:: 7z a -sfx7.sfx -t7z -mx=9 %USERPROFILE%\Documents\OBS_KIT-PACK\_SAUVEGARDES\SAUVEGARDE_OBS-Logiciel-Plugins-%username%-%madate%.exe "%PROGRAMFILES%"
