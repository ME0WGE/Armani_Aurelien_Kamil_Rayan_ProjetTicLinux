#!/bin/bash

liste_tache="liste_tache.txt"

while true
do
    read -p "Entrez une commande: 
1. Ajouter une tâche
2. Supprimer une tâche
3. Afficher toutes les tâches
4. Rechercher une tâche
5. Quitter
> " cmd
    if [ $cmd == "1" ]
    then
        clear
        echo "1"
    elif [ $cmd == "2" ]
    then
        clear
        echo "2"
    elif [ $cmd == "3" ]
    then
        clear
        echo "3"
    elif [ $cmd == "4" ]
    then
        clear
        echo "4"
    elif [ $cmd == "5" ]
    then
        break
        clear
    fi
done