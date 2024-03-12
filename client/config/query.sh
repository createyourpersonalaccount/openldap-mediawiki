#!/bin/sh
ldapsearch -H ldaps://ldap.cclub -xw secret  \
           -D 'cn=Manager,dc=example,dc=com' \
           -b 'dc=example,dc=com' '(objectclass=*)'
