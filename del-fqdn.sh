# SCRIPT SUPPRIMER FQDN

/bin/sed -i "/$1/d" /etc/tinydns/root/data
/usr/bin/make