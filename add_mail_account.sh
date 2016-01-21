#!/bin/bash

#script pour ajouter un compte mail

new=$1

if [ -z $new ];then
        echo "ERREUR veuillez entrer un nom pour le compte"
else
        new=$1@
        verif=`/bin/grep $new /etc/postfix/jedimailbox`
        if [ -z "$verif" ];then
                new=$1
                pass=$2
                #cote postfix
                /bin/echo "$new@jedi.star /$new/" >> /etc/postfix/jedimailbox
                /usr/sbin/postmap /etc/postfix/jedimailbox

                #creation du repertoire du compte
                /bin/mkdir /var/mail/$new
                /bin/mkdir /var/mail/$new/cur
                /bin/mkdir /var/mail/$new/new
                /bin/mkdir /var/mail/$new/tmp

                #changement de propiertaire des repertoires
                /bin/chown -R jedimail:jedimail /var/mail/$new
                /bin/chown -R jedimail:jedimail /var/mail/$new/*


                #cote courier-imap
                /usr/sbin/userdb $new set home=/var/mail/$new mail=/var/mail/$new uid=1001 gid=1001
/bin/echo $pass | /usr/sbin/userdbpw -md5 | /usr/sbin/userdb "$new" set systempw

/usr/sbin/makeuserdb
        else
                echo "Ce compte existe deja, desoler"
        fi
fi