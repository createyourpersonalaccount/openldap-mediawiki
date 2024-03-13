#!/bin/sh
openssl req -config x509-cert/cert.cnf   \
            -x509 -days 365              \
            -newkey rsa                  \
            -out x509-cert/ldapscert.pem


