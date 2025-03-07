#!/bin/bash
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
        break
        clear
    fi
done