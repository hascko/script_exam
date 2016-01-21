# SCRIPT SUPPRIMER FQDN

/bin/sed -i "/$1/d" /etc/tinydns/root/data
cd /etc/tinydns/root/
/usr/bin/make