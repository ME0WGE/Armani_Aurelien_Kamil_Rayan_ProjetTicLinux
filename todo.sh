#!/bin/bash

# VARIABLES
FICHIER_TACHES="tasks.txt"
# Création du fichier tasks.txt s'il n'existe pas déjà dans le dossier
if [ ! -f "$FICHIER_TACHES" ]
then
    touch "$FICHIER_TACHES"
fi

# FONCTIONS
# Message de Bienvenue
message_bienvenue() {
    clear
    echo "╔═════════════════════════════════════════╗"
    echo "║                 ToDo APP                ║"
    echo "║     Bienvenue dans votre ToDo APP       ║"
    echo "╚═════════════════════════════════════════╝"
}
# Ajouter une tâche
ajouter_tache() {
    echo "|=== Ajouter une nouvelle tâche ===|"
    echo "Entrez le description de la tâche > "
    read description

    if [ -z "$description" ]
    then
        echo "Nop! La descriptionne peut pas être vide :angry-stare:"
        return
    fi

    echo "$description" >> "$FICHIER_TACHES"
    echo "Votre tâche a été ajoutée avec succès!"
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
