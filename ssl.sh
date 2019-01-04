#!/bin/bash
set -e 
NAME=$1
if [ "$#" -eq 0 ]; then
	echo "First argument is fqdn, optional arguments are country, city and company, in that order, last argument is state, if applicable"
	exit 1
fi
if [ "$#" -ge 1 ]; then
	SUBJECT="/C=MK/ST=MK/L=Skopje/O=Firma/OU=IT/CN=$NAME"
fi
if [ "$#" -eq 4 ]; then
	COUNTRY="${@:2:1}"
	CITY="${@:3:1}"
	COMPANY="${@:4:1}"
	STATE=$COUNTRY
	SUBJECT="/C=$COUNTRY/ST=$STATE/L=$CITY/O=$COMPANY/OU=IT/CN=$NAME"
fi
if [ "$#" -eq 5 ]; then
	COUNTRY="${@:2:1}"
        CITY="${@:3:1}"
        COMPANY="${@:4:1}"
        STATE="${@:5:1}"
        SUBJECT="/C=$COUNTRY/ST=$STATE/L=$CITY/O=$COMPANY/OU=IT/CN=$NAME"
fi
openssl genrsa -out $NAME.key 2048
openssl rsa -passin pass:x -in $NAME.pass.key -out $NAME.key
openssl req -new -key $NAME.key -out $NAME.csr -subj $SUBJECT
openssl x509 -req -sha256 -days 365 -in $NAME.csr -signkey $NAME.key -out $NAME.crt


