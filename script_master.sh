#!/bin/bash
#---------------------------------------------------------------------
#OPENWORLD
#SCRIPT MASTER
#AUTEUR MOUGNIN SERGE
#Date 28/11/2015
#---------------------------------------------------------------------

while :
do

        clear;
        echo "Bienvenue dans le script master des JEDI";
        echo " ";
        echo "1-  Création d'un VHOST";
        echo "2-  Suppression d'un VHOST";
        echo "3-  Création d'une adresse mail";
        echo "4-  Suppression d'une adresse mail";        
        echo " ";
        echo "Entrer votre choix";
        read choix;
        if [ $choix == "1" ]
        then
                echo "Vous souhaitez créer un VHOST";
                echo "Entrez le nom du VHOST";
                read nom;
                echo "Entrer le mot de passe";
                read mdp;
                sudo /var/script/add_vhost.sh $nom $mdp;
                echo "Le VHOST $nom a bien été créé";

        elif [ $choix == "2" ]
        then
                echo "Vous souhaitez supprimer un VHOST";
                echo "Entrez le nom du VHOST";
                read nom;
                echo "Voulez vous réellement supprimer $nom ? oui/non";
                read reponse;
                if [ $reponse == "oui" ]
                then
                        sudo /var/script/remove_vhost.sh $nom;
                        echo "Le VHOST $nom a bien été supprimé";
                else
                        echo "$nom peut me remercier";
                fi

        elif [ $choix == "3" ]
        then
                echo "Vous souhaitez créer une adresse mail jedimail";
                echo "Entrez le nom du client";
                read nom;
                echo "Entrez le mot de passe";
                read mdp;
                sudo /var/script/add_mail_account.sh $nom $mdp;
                echo "Bienvenu parmi nous $nom@jedi.star";

        elif [ $choix == "4" ]
        then
                echo "Vous souhaitez supprimer une adresse mail";
                echo "Entrez le nom du client";
                read nom;
                echo "Voulez vous réellement supprimer $nom@openworld.itinet.fr ? oui/non";
                read reponse;
                if [ $reponse == "oui" ]
                then
                        sudo /var/script/del_mail_account.sh $nom;
                        echo "L'adresse $nom@jedi.star a bien été supprimé";
                else
                        echo "$nom@jedi.star peut me remercier";
                fi  

        else
                echo "Cette option n'existe pas :p";
        fi

        echo "Voulez-vous continuer ? oui/non"
        read reponse

        if [ $reponse = "non" -o $reponse = "NON" ];then
                break
        fi
done
clear;                                               