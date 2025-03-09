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
    echo "|=== Ajouter une Nouvelle Tâche ===|"
    echo "Entrez la description de la tâche > "
    read description

    if [ -z "$description" ]
    then
        echo "Nop! La description ne peut pas être vide :angry-stare:"
        return
    fi

    echo "$description" >> "$FICHIER_TACHES"
    echo "Votre tâche a été ajoutée avec succès!"
}
# Supprimer une tâche
supprimer_tache() {
    echo "|=== Supprimer une Tâche ===|"
    # Vérifier si le tasks.txt est vide
    if [ ! -s "$FICHIER_TACHES" ]
    then
        echo "La liste des tâches est vide. Aucune tâche à supprimer"
        return
    fi

    # Afficher les numéros devant les tâches
    echo '/// Liste des Tâches \\\'
    nl -w1 -s". " "$FICHIER_TACHES"

    echo "Entrez le numéro de la tâche à supprimer > "
    read numero_tache

    # Vérifier que l'input de l'utilisateur est un nombre
    if ! [[ "$numero_tache" =~ ^[0-9]+$ ]]
    then
        echo "Nop! Veuillez entrer un numéro :angry-stare:"
        return
    fi

    # Compter le nombre de tâches dans tasks.txt
    nombre_taches=$(wc -l < "$FICHIER_TACHES")

    # Vérifier si le numéro de la tâche existe
    if [ "$numero_tache" -lt 1 ] || [ "$numero_tache" -gt "$nombre_taches" ]
    then
        echo "Nop! Le numéro de la tâche n'existe pas."
        return
    fi

    # Créer un fichier temporaire sans la tâche à supprimer
    sed -i "${numero_tache}d" "$FICHIER_TACHES"
    echo "Tâche $numero_tache a été supprimée avec succès!"
}
# Afficher les tâches
afficher_tache() {
    echo "|=== Afficher les Tâches ===|"

    # Vérifier si le tasks.txt est vide
    if [ ! -s "$FICHIER_TACHES" ]
    then
        echo "Aucune tâche."
    else
        nl -w1 -s". " "$FICHIER_TACHES"
    fi
}
# BONUS
# Modifier une tâche existante
modifier_tache() {
    echo "|=== Modifier une Tâche ===|"

    # Vérifier si le tasks.txt est vide
    if [ ! -s "$FICHIER_TACHES" ]
    then
        echo "La liste des tâches est vide. Aucune tâche à modifier"
    else
    # Afficher les numéros devant les tâches
        echo '\\\ Liste des Tâches ///'
        nl -w1 -s". " "$FICHIER_TACHES"

        echo "Entrez le numéro de la tâche à modifier > "
        read numero_tache

    # Vérifier que l'input de l'utilisateur est un nombre
        if ! [[ "$numero_tache" =~ ^[0-9]+$ ]]
        then
            echo "Nop! Veuillez entrer un numéro :angry-stare:"
            return
        fi

    # Compter le nombre de tâches dans tasks.txt
        nombre_taches=$(wc -l < "$FICHIER_TACHES")

    # Vérifier si le numéro de la tâche existe
        if [ "$numero_tache" -lt 1 ] || [ "$numero_tache" -gt "$nombre_taches" ]
        then
            echo "Nop! Le numéro de la tâche n'existe pas."
            return
        fi

    # Récupérer la tâche actuelle
        tache_actuelle=$(sed -n "${numero_tache}p" "$FICHIER_TACHES")
        echo "Tâche actuelle: $tache_actuelle"

        echo "Entrez la nouvelle description de la tâche > "
        read nouvelle_description

        if [ -z "$nouvelle_description" ]
        then
            echo "Nop! La description ne peut pas être vide :angry-stare:"
            return
        fi

    # Modifier la tâche dans le tasks.txt
        sed -i "${numero_tache}s/.*/$nouvelle_description/" "$FICHIER_TACHES"
        echo "Tâche $numero_tache a été modifiée avec succès!"
    fi
}



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
