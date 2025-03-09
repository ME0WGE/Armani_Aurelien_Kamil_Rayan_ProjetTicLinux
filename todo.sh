#!/bin/bash

liste_tache="liste_tache.txt"

add_task(){
    echo "Veuillez entrer une tâche:"
     read tache
     echo $tache >> $liste_tache
     echo "la tache: $tache a bien été ajoutée"
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