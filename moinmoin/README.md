# Moinmoin Wiki
This is based on the official documentation at https://moinmo.in/HowTo/UbuntuQuick#Nginx_Installation, but for FreeBSD 10.1-RELEASE.

    pkg install moinmoin uwsgi


# Helper functions

### diffs
    diff /usr/local/share/moin/config/wikiconfig.py /usr/local/www/wiki/wikiconfig.py
    diff /usr/local/share/moin/server/moin.wsgi /usr/local/www/wiki/moin.wsgi                                                 
