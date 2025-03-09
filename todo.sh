#!/bin/bash









# Boucle du programme
while true
do
    message_bienvenue
    echo "==========================================="
    echo "| 1. Ajouter une tâche                    |"
    echo "| 2. Supprimer une tâche                  |"
    echo "| 3. Modifier une tâche                   |"
    echo "| 4. Afficher toutes les tâches           |"
    echo "| 5. Quitter                              |"
    echo "==========================================="
    read -p "Choisissez une option (1-5)> " choix
    
    case $choix in
        1)
            clear
            ajouter_tache
            read -p "Appuyez sur ENTER pour continuer..."
            ;;
        2)
            clear
            supprimer_tache
            read -p "Appuyez sur ENTER pour continuer..."
            ;;
        3)
            clear
            modifier_tache
            read -p "Appuyez sur ENTER pour continuer..."
            ;;
        4)
            clear
            afficher_tache
            read -p "Appuyez sur ENTER pour continuer..."
            ;;
        5)
            clear
            echo "Bye :>"
            exit 0
            ;;
        *)
            echo "Option invalide. Veuillez entrer un nombre entre 1 et 4."
            read -p "Appuyez sur ENTER pour continuer..."
            ;;
    esac
done
