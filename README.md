#  ATTENTION

#  Ces scripts s'executent dans un environnement "NORMALISÉ"

#  - Préambule : explication prélimlinaires nécessaires
#  - Strcutures
#  - Notes
#  - Vademecum de normalisation
#  - Compression / décompression : vademecum 7z
#  - Date : ajout de date dans le nom de l'archive


#  + NOTA BENE : %username% est une variable d'environnement WINDOWS
#  + Elle spécifie l'utilsateur courant
#  ↓ Dans le script elle permet une exécution polyvalente
#  ↓
#  ++ RAPPEL : quelques variables WINDOWS
#  %USERNAME%	{username}
#  %HOMEPATH%	C:\Users\{username}
#  %USERPROFILE%	C:\Users\{username}
#  %APPDATA%	C:\Users\{username}\AppData\Roaming
#  %PROGRAMFILES%	C:\Program Files
#  %PROGRAMFILES(X86)%	C:\Program Files (x86)

#  ++ RAPPEL OBS
#  Le logiciel OBS s'installe dans               C:\Program Files => variable d'environnement %PROGRAMFILES%
#  Les preférences utilisateur s'installent dans C:\Users\{username}\AppData\Roaming => variable d'environnement %APPDATA%


#  <---- PREAMBULE ---->
#  Pour la normalisation le répertoire obs-studio "utilisateur" est déplacé
#  On crée un lien de 'Normalisation'

#  
#  
#  


#  <---- NOTES ---->
#  Il y a différentes versions de scripts
#  - Exécutables uniquement en mode administrateur
#  - Autonomes avec élévations scriptée des privilèges pour s'auto-exécuter en mode administrateur


#  <--- Vademecum ---->
#  Je mets à disposition un vademecum pour créer les répertoires ad-hoc
#  Créer l'environnement utilisateur et les liens symboliques nécessaires


#  --- 7z doit être préalabement installé

#  Rappel de Commandes types
