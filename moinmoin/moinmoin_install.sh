#!/bin/sh
#
### The following is ALMOST the default message after installing 'moinmoin'
### package with pkg wrapped into a shell script. My changes are:
### - Installs into /usr/local/www/wiki
### - Uses "moin.wsgi" instead of "moin.cgi"

# Important: You have currently no wiki instance installed.
# 
# If you're installing from ports, just run 'make instance'
# with appriopriate arguments.
# eg. make MOINTYPE=FCGI MOINDEST=/usr/local/www/wiki instance
# 
# If you're installing from package, run these commands.
# 
# Choose here one script depending on the type of wiki you
# want : moin.py (standalone), moin.fcg (FCGI), moin.wsgi (WSGI) or moin.cgi.
export MOINSCRIPT="moin.wsgi"
# Defaults should be fine but you may want to modify these.
export MOINDIR="/usr/local/share/moin"
export MOINDEST="/usr/local/www/wiki"
# Set this to your apache user and group.
export CGIUSER="www"
export CGIGROUP="www"

mkdir -p ${MOINDEST}/data
mkdir -p ${MOINDEST}/underlay
cp -R ${MOINDIR}/data ${MOINDEST}
cp -R ${MOINDIR}/underlay ${MOINDEST}
chmod -R u+rw,go-ws ${MOINDEST}/data
install -m 0555 ${MOINDIR}/config/wikiconfig.py ${MOINDEST}
test -z "${MOINSCRIPT}" || \
        install -m 0555 ${MOINDIR}/server/${MOINSCRIPT} ${MOINDEST}
chown -R ${CGIUSER}:${CGIGROUP} ${MOINDEST}

# Note: export might not work with your shell, use
# setenv VAR 'value' instead
