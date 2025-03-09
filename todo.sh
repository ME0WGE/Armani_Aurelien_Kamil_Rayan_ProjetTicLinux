#!/bin/bash

# VARIABLES
liste_tache="litste_tache.txt"
# Création du fichier tasks.txt s'il n'existe pas déjà dans le dossier
if [ ! -f "$liste_tache" ]
then
    touch "$liste_tache"
fi


add_task(){
  echo "Veuillez entrer une tâche:"
  read tache
  echo $tache >> liste_tache.txt
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