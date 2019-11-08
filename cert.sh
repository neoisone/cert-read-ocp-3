#! /bin/bash

# this script  shows the issuer, subject, SAN's of all certs present inside Openshift 3.x

cert_name=`ls -R /etc/origin/ | grep crt`

all_certs_path=`for i in $cert_name ;do find /etc/origin/ -name $i; done`

for i in $all_certs_path; do echo "---BEGIN---" ; echo $i ; echo "--------------";openssl x509 -in $i -noout -issuer -subject; openssl x509 -in $i -text | grep Alternative -A1 ;echo "---END---";echo;echo;done
