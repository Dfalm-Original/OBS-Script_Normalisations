#### <span style="color:green">Script in French pending translations into English and other languages</span>

# Divers Script OBS
## Sauvegarde
## Restauration
## Migration


Ce **README** est une simple présentation<br>
( *Plus de détails dans un fichier spécifique* )

##  !!!! ATTENTION !!!!

Ces scripts s'executent dans un environnement "NORMALISÉ"

- Préambule : explication prélimlinaires nécessaires
- Strcutures
- Notes
- Vademecum de normalisation
- Compression / décompression : vademecum 7z
- Date : ajout de date dans le nom de l'archive

#### <span style="color:red"> Dans un premier temps ces scripts sont orientés "Microsoft Windows"</span>
Par la suite ils seront adapté sous GNU/Linux
Sous Linux toutes les options sont regroupées dans **.config/obs-studio**<br>
C'est donc plus simple ... VOIR PLUS TARD !



 NOTA BENE : **%username%** est une variable d'environnement *WINDOWS*<br>
 Elle spécifie l'utilsateur courant<br>
↓ Dans le script elle permet une exécution polyvalente<br>
RAPPEL : quelques variables WINDOWS

- %USERNAME%	{username}
- %HOMEPATH%	C:\Users\{username}
- %USERPROFILE%	C:\Users\{username}
- %APPDATA%	C:\Users\{username}\AppData\Roaming
- %PROGRAMFILES%	C:\Program Files
- %PROGRAMFILES(X86)%	C:\Program Files (x86)

!! PREFERER la variable générique **"%USERPROFILE%"** à *"%USERNAME%"* qui est spécifique !!

### RAPPEL OBS
Sous Windows
- Le logiciel OBS s'installe dans               **C:\Program Files** => variable d'environnement *%PROGRAMFILES%*
- Les preférences utilisateur s'installent dans **C:\Users\{username}\AppData\Roaming** => variable d'environnement *%APPDATA%*
NB : !! D'anciennes version d'OBS-STUDIO peuvent se trouver dans l'ancien répertoire "32 bits" AKA	**C:\Program Files (x86)** => variable d'environnement %PROGRAMFILES(X86)% !!

### <---- PREAMBULE ---->
Pour la normalisation le répertoire obs-studio "utilisateur" est déplacé (*ne s'applique pas pouur Linux*)<br>
On crée un lien de '*Normalisation*'

### <---- STRUCTURE ---->
La Strcuture est détailée dans une fichier à part

###  <---- NOTES ---->
Il y a différentes versions de scripts
- Exécutables uniquement en mode administrateur ( **Windows** )
- Autonomes avec élévations scriptée des privilèges pour s'auto-exécuter en mode administrateur ( **Windows** )


###  <--- Vademecum ---->
Je mets à disposition un vademecum pour créer les répertoires ad-hoc<br>
Crée l'environnement utilisateur et les liens symboliques nécessaires

### <---- 7Z compression/décompression --->
####  --- 7z doit être préalabement installé
Rappel de Commandes types

### <---- DATE --->
Le script ajoute la date au nom de l'archive + le nom courant de l'utilisateur<br>
Présentation des 2 méthodes pour ajouter la date ( **Windows** )

# **Rappel :**
Ce **README** est une simple présentation<br>
( *Plus de détails dans un fichier spécifique* )
