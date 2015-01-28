# Moinmoin Wiki
This is based on the official documentation at https://moinmo.in/HowTo/UbuntuQuick#Nginx_Installation, but for FreeBSD 10.1-RELEASE.

    pkg install moinmoin uwsgi


## Helper functions

### find static content
It is the function from the find_moin_htdocs.sh.

    dirname `pkg query %Fp moinmoin | grep "htdocs/index.html"`
    
### diffs
    diff /usr/local/share/moin/config/wikiconfig.py /usr/local/www/wiki/wikiconfig.py
    diff /usr/local/share/moin/server/moin.wsgi /usr/local/www/wiki/moin.wsgi                                                 
