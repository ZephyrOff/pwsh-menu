# :bookmark_tabs: pwsh-menu
# Informations
Générateur d'un menu à touches fléchées.<br>
Le choix dans le menu se fait à partir des touches fléchées pour la navigation et de la touche Enter pour la validation.<br>
Customisation des couleurs du menu et du curseur possibles.<br>
Retourne l'indice du choix sélectionné
<br>

# Utilisation
```powershell
$choice = Menu $Title $OptionList
```
>En paramètre supplémentaire, nous pouvons mettre:<br/>
>- Background = Choisir la couleur de font du choix selectionné
>- Foreground = Choisir la couleur du texte du choix selectionné
>- Pointer = Choisir un pointeur à afficher avant le choix
>- Padding = Choisir la taille du décalage entre le titre et les choix

# Exemple
![Exemple_menu](Asset/example.png)