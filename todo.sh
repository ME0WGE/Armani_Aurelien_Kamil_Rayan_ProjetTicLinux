#!/bin/bash

# Liste des éléments
liste=("Pomme" "Banane" "Orange" "Raisin" "Mangue")

# Afficher la liste numérotée
# echo "Liste actuelle :"
i=1
for element in "${liste[@]}"
do
  echo "$i. $element"
  ((i++))
done

# echo -n "Entrez les numéros des éléments à supprimer (séparés par des espaces) : "
read -a to_remove

for num in "${to_remove[@]}"
do
  if (( num >= 1 && num <= ${#liste[@]} )); then
    unset 'liste[$((num-1))]'
  else
    echo "Numéro $num invalide."
  fi
done

liste=("${liste[@]}")

# Afficher la liste après 
# echo "Liste après suppression :"
i=1
for element in "${liste[@]}"
do
  echo "$i. $element"
  ((i++))
done
