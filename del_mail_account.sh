#!/bin/bash
#Script permettant de supprimer un compte mail

user=$1

if [ -z $user ];then
        echo "ERREUR veuillez entrer un nom"
else
        verif=`/bin/grep $user /etc/postfix/jedimailbox`
        if [ -z "$verif" ];then
                echo "Ce compte n'existe pas donc ne peut etre supprime"
        else
                #suppression de la ligne dans vmailbox
                /bin/sed -i "/$user@/d" /etc/postfix/jedimailbox
                /usr/sbin/postmap /etc/postfix/jedimailbox

                #suppression du repertoire du compte
                `/bin/rm -r /var/mail/$user`

                #suppression dans le fichier userdb
                /bin/sed -i "/$user[[:space:]]/d" /etc/courier/userdb
                /usr/sbin/makeuserdb
        fi
fi