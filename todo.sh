#!/bin/bash

liste_tache="liste_tache.txt"


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
    add_task
  elif [ $cmd == "2" ]
  then
    clear
    del_task
  elif [ $cmd == "3" ]
  then
    clear
    cat liste_tache.txt
  elif [ $cmd == "4" ]
  then
    break
    clear
  fi
done
