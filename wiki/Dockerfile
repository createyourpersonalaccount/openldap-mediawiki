# syntax=docker/dockerfile:1
FROM mediawiki:latest
ARG LDAP_PROVIDER_TARBALL
ARG PLUGGABLE_AUTH_TARBALL
ARG LDAP_AUTHENTICATION2_TARBALL
COPY --chmod=644                        \
      ./wiki/config/ldapprovider.json   \
      /etc/mediawiki/
COPY --chmod=644                \
     --chown=root:ldap          \
     ./x509-cert/ldapscert.pem  \
     ./wiki/config/ldap.conf    \
     /etc/ldap/
RUN mkdir --parents ./extensions/LDAPProvider &&                        \
    curl --location --silent ${LDAP_PROVIDER_TARBALL} |                 \
    tar xzC ./extensions/LDAPProvider --strip-components=1 &&           \
    chown --recursive www-data:www-data ./extensions/LDAPProvider
RUN mkdir --parents ./extensions/PluggableAuth &&                  \
    curl --location --silent ${PLUGGABLE_AUTH_TARBALL} |           \
    tar xzC ./extensions/PluggableAuth --strip-components=1 &&     \
    chown --recursive www-data:www-data ./extensions/PluggableAuth
RUN mkdir --parents ./extensions/LDAPAuthentication2 &&                 \
    curl --location --silent ${LDAP_AUTHENTICATION2_TARBALL} |          \
    tar xzC ./extensions/LDAPAuthentication2 --strip-components=1 &&    \
    chown --recursive www-data:www-data ./extensions/LDAPAuthentication2
RUN apt update &&                       \
    apt install --yes libldap2-dev &&   \
    docker-php-ext-install ldap
