#!/bin/bash
#---------------------------------------------------------------------
#OPENWORLD
#AJOUT D'UN VHOST
#AUTEUR MOUGNIN SERGE
#Date 09/11/2015
#---------------------------------------------------------------------

if test -z "$1";
then
        /bin/echo "Erreur ! Entrer en argument le nom du VHOST"
else
        #Creation des dossiers dans /var/blog/
        /bin/mkdir /var/blog/$1.jedi.star/

        #Creation du groupe et configuration du fichier sftp_config
        if /bin/grep -q "jedi" "/etc/group";
        then
                #Creation de l'utilisateur
                #password=$(/usr/bin/mkpasswd $2)
                /usr/sbin/useradd $1 --shell /usr/bin/mysecureshell --gid 1991 --home /var/blog/$1.jedi.star -m
                
/usr/bin/passwd $1 <<EOF 
$2
$2
EOF


                /usr/bin/touch /var/blog/$1.jedi.star/index.php

                /bin/echo "<?php echo 'Bonjour '?> $1" >> /var/blog/$1.jedi.star/index.php

                #Ajout d'un vhost dans le fichier de configuration
                /bin/echo "<VirtualHost *:80>" >> /etc/apache2/sites-available/$1.conf
                /bin/echo "ServerName $1.jedi.star" >> /etc/apache2/sites-available/$1.conf
                /bin/echo "DocumentRoot /var/blog/$1.jedi.star/" >> /etc/apache2/sites-available/$1.conf
                /bin/echo "</VirtualHost>" >> /etc/apache2/sites-available/$1.conf

                #Création du lien symbolique dans sites-enabled
                /bin/ln -s /etc/apache2/sites-available/$1.conf /etc/apache2/sites-enabled/

                #Création fqdnç
                /var/script/add-fqdn.sh $1

                #Redemarrage de Apache
                /usr/sbin/service apache2 reload

        else
                #/usr/sbin/addgroup groupe_utilisateur --gid 1009
                echo "Créez un groupe avec le GID 1009 et on en reparle";
        fi
fi