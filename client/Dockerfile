# syntax=docker/dockerfile:1
FROM alpine:latest
ARG LDAP_SERVER_FQDN
ENV LDAP_SERVER_FQDN=${LDAP_SERVER_FQDN}
COPY --chmod=644                \
     --chown=root:ldap          \
     ./x509-cert/ldapscert.pem  \
     ./client/config/ldap.conf  \
     /etc/openldap/
COPY --chmod=755                        \
     ./client/config/query.sh /
RUN   apk update --no-cache &&                  \
      apk add -U --no-cache openldap-clients
