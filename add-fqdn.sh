#!/bin/bash
# SCRIPT AJOUTER FQDN
/bin/echo "=$1.jedi.star:10.8.100.48:86400" >> /etc/tinydns/root/data
cd /etc/tinydns/root/
/usr/bin/make