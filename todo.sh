#!/bin/bash

liste_tache="liste_tache.txt"

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
        echo "2"
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