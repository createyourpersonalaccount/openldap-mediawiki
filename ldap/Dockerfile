# syntax=docker/dockerfile:1
FROM alpine:latest
RUN apk update --no-cache &&                            \
    apk add -U --no-cache openldap openldap-back-mdb && \
    install -m 750 -o ldap -g ldap                      \
            -d /etc/openldap/slapd.d                    \
               /var/lib/openldap/example-com &&         \
    install -m 700 -o ldap -g ldap                      \
            -d /var/lib/openldap/openldap-data &&       \
    rm -f /etc/openldap/ldap.conf                       \
          /etc/openldap/slapd.conf
COPY --chmod=640                        \
     --chown=root:ldap                  \
     ./ldap/config/slapd.ldif           \
     ./ldap/config/example.com.ldif     \
     ./x509-cert/ldapscert.pem          \
     ./x509-cert/ldapskey.key           \
     /etc/openldap/
RUN chmod o+r /etc/openldap/ldapscert.pem &&   \
    slapadd -n 0                               \
            -F /etc/openldap/slapd.d           \
            -l /etc/openldap/slapd.ldif &&     \
    slapadd -b 'dc=example,dc=com'             \
            -F /etc/openldap/slapd.d           \
            -l /etc/openldap/example.com.ldif
ENTRYPOINT slapd -d -1 -h ldaps:///
