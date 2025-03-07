#!/bin/bash

liste_tache="liste_tache.txt"


add_task(){
  echo "Veuillez entrer une tâche:"
  read tache
  echo $tache >> $liste_tache
}

del_task(){
  u=1
  mapfile -t liste < liste_tache.txt
  for element in "${liste[@]}"
  do
    echo "$u. $element"
    ((u++))
  done
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
      del_task
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
