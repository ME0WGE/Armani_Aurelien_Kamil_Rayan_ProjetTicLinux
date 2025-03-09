#!/bin/bash

# VARIABLES
liste_tache="liste_tache.txt"
# Création du fichier tasks.txt s'il n'existe pas déjà dans le dossier
if [ ! -f "$liste_tache" ]
then
    touch "$liste_tache"
fi
# Message de Bienvenue
message_bienvenue() {
    clear
    echo "╔═════════════════════════════════════════╗"
    echo "║                 ToDo APP                ║"
    echo "║     Bienvenue dans votre ToDo APP       ║"
    echo "╚═════════════════════════════════════════╝"
}
# Afficher une tâche
afficher_tache() {
    echo "|=== Afficher les Tâches ===|"

    # Vérifier si le tasks.txt est vide
    if [ ! -s "$liste_tache" ]
    then
        echo "Aucune tâche."
    else
        nl -w1 -s". " "$liste_tache"
    fi
}

add_task(){
    echo "Veuillez entrer une tâche:"
     read tache
     if [ -z "$tache" ]
    then
        echo "Vous n'avez rien écrit. La tache ne peut pas être un champ vide."
        return
    fi
     echo $tache >> $liste_tache
     echo "la tache: $tache a bien été ajoutée"
}

add_Modif() {
    # Vérifier si le fichier existe et contient des tâches
    if [[ ! -f $Liste_tache || ! -s $Liste_tache ]]; then
        echo "Aucune tâche enregistrée."
        return
    fi

    # Afficher la liste des tâches
    echo "Liste des tâches :"
    cat "$Liste_tache"

    # Demander l'index de la tâche à modifier
    echo "Veuillez entrer l'index de la tâche à modifier :"
    read index

    # Vérifier si l'index est valide
    if ! [[ $index =~ ^[0-9]+$ ]]; then
        echo "Erreur : L'index doit être un nombre."
        return
    fi

    # Extraire la tâche actuelle
    old_task=$(sed -n "${index}p" "$Liste_tache")

    # Vérifier si la tâche existe
    if [[ -z "$old_task" ]]; then
        echo "Erreur : Aucune tâche trouvée à l'index $index."
        return
    fi

    # Afficher la tâche actuelle
    echo "Tâche actuelle : $old_task"
    
    # Demander la nouvelle tâche
    echo "Vous souhaitez modifier $old_task par:"
    read new_task

    # Modifier la tâche dans le fichier
    sed -i "${index}s/.*/$index. $new_task/" "$Liste_tache"

    echo "Tâche $index modifiée avec succès ! La tâche est désormais $new_task !"
}

del_task(){
  #création de list
  liste_suppresion=()
  nouvel_list=()
  u=0
  #recupere le fichier texte dans une variable
  mapfile -t liste < liste_tache.txt
  for element in "${liste[@]}"
  do
    echo "$u. $element"
    ((u++))
  done
  read -p "supprimer quel element (un nombre ) :
  > " nbs
  #demande quel variable suprimer
  u=0
  #pour chaque element de la liste 
  for element in "${liste[@]}"
  do
    if [[ $u -ne $nbs ]]
    then
      nouvel_list+=("$element")
    fi
    ((u++))
  done
  printf "%s\n" "${nouvel_list[@]}" > liste_tache.txt
}


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
            add_task
            read -p "Appuyez sur ENTER pour continuer..."
            ;;
        2)
            clear
            del_task
            read -p "Appuyez sur ENTER pour continuer..."
            ;;
        3)
            clear
            add_modif
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