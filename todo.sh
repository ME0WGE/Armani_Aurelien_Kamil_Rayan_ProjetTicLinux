#!/bin/bash

# FONCTIONS
# Message de Bienvenue
message_bienvenue() {
    clear
    echo "╔═════════════════════════════════════════╗"
    echo "║                 ToDo APP                ║"
    echo "║     Bienvenue dans votre ToDo APP       ║"
    echo "╚═════════════════════════════════════════╝"
}



# Boucle du programme
while true
do
    message_bienvenue
    echo "========================================"
    echo "1. Ajouter une tâche"
    echo "2. Supprimer une tâche"
    echo "3. Afficher toutes les tâches"
    echo "4. Quitter"
    echo "========================================"
    
    read -p "Choisissez une option (1-4)> " choix
    
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
            afficher_tache
            read -p "Appuyez sur ENTER pour continuer..."
            ;;
        4)
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
