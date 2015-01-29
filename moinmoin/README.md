# Moinmoin Wiki

I really like MoinMoin Wiki (https://moinmo.in/) because it stores all pages/content within a subdirectory structure and not in a database. That makes it easy to maintain and move. And it is written in Python ;-)

This guide is based on the official documentation at https://moinmo.in/HowTo/UbuntuQuick#Nginx_Installation, but for FreeBSD 10.1-RELEASE. The wiki will be placed into /usr/local/www/wiki and served through nginx at http://webserver/wiki/. Static content will be served directly through nginx, not through moinmoin wiki itself.

Please check all scripts and patch files before running/applying them to your environment.

## Install software

    pkg install moinmoin uwsgi

After installing the packages a basic instance of the wiki must be installed. To install it into /usr/local/www/wiki and create a socket subdirectory for the uwsgi process later on run:

    moinmoin_install.sh

## Modify moinmoin settings
Modify your settings for the wiki by going through these steps:

    cd /usr/local/www/wiki
    vi moin.wsgi
    vi wikiconfig.py

Change these files as needed, see the *.patch files or below for hints:
### moin.wsgi
Add two sys.path.insert lines into the a2 section of the file (at line 29)
  
    sys.path.insert(0, '/usr/local/lib/python2.7/site-packages')
    sys.path.insert(0, '/usr/local/www/wiki')

Change make_application to "False" (the last line)

    application = make_application(shared=False)

### wikiconfig.py
Change to your likings, but the following lines are important:

* Remove the leading "#" the activate "url_prefix_static" as we are serving our wiki from "/wiki"
* Change line 94 ("superuser") and 99 to represent your future username as administrator for this wiki
* Change page_front_page and language_default as you prefer

So you should end up with a wikiconfig.py containing those new active lines:

    url_prefix_static = '/wiki' + url_prefix_static
    page_front_page = u"StartSeite"
    superuser = [u"YourUserName", ]
    acl_rights_before = u"YourUserName:read,write,delete,revert,admin"
    language_default = 'de'


## Modify nginx.conf
Add nginx.conf.add into your /usr/local/etc/nginx/nginx.conf with your favorite editor. It goes directly into one "server" block.

## Start the services

    /usr/local/etc/rc.d/uwsgi start
    /usr/local/etc/rc.d/nginx start
    
Try to browse http://webserver/wiki/ to access your brand new MoinMoin wiki.

## Modify rc.conf

If the above commands ran succesfully and you can browse your wiki, it is time to make these changes permanent.
Add rc.conf.add to your /etc/rc.conf to activate your nginx webserver and the uwsgi socket at boot time.


# Additional Helper functions

### find static content
It is the function from the find_moin_htdocs.sh.

    dirname `pkg query %Fp moinmoin | grep "htdocs/index.html"`
    
### diffs
    diff /usr/local/share/moin/config/wikiconfig.py /usr/local/www/wiki/wikiconfig.py
    diff /usr/local/share/moin/server/moin.wsgi /usr/local/www/wiki/moin.wsgi                                                 
