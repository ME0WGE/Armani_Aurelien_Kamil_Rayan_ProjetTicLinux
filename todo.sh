#!/bin/bash

liste_tache="liste_tache.txt"

# i=1
# for element in "${liste[@]}"
# do
#   echo "$i. $element"
#   ((i++))
# done

add_task(){
    echo "Veuillez entrer une tâche:"
     read tache
     echo $tache >> $liste_tache
}

while true
do
    read -p "Entrez une commande: 
1. Ajoutez une tâche
2. Supprimer une tâche
3. Afficher toutes les tâches
4. Quitter
> " cmd
    if [ $cmd == "1" ]
    then
        clear
        add_task
    elif [ $cmd == "2" ]
    then
        clear
        echo "2"
    elif [ $cmd == "3" ]
    then
    clear
        cat $liste_tache
    elif [ $cmd == "4" ]
    then
        break
        clear
    fi
done

#!/bin/bash

# Liste des éléments
liste=("Pomme" "Banane" "Orange" "Raisin" "Mangue")

# Afficher la liste numérotée
# echo "Liste actuelle :"
i=1
for element in "${liste[@]}"
do
  echo "$i. $element"
  ((i++))
done

# echo -n "Entrez les numéros des éléments à supprimer (séparés par des espaces) : "
read -a to_remove

for num in "${to_remove[@]}"
do
  if (( num >= 1 && num <= ${#liste[@]} )); then
    unset 'liste[$((num-1))]'
  else
    echo "Numéro $num invalide."
  fi
done

liste=("${liste[@]}")

# Afficher la liste après 
# echo "Liste après suppression :"
i=1
for element in "${liste[@]}"
do
  echo "$i. $element"
  ((i++))
done
