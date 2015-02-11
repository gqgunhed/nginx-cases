#nginx.conf snippets
for inclusion or as hint for different scenarions. Sometimes just a kind of notebook for me.

##Logfiles/Pidfiles
I like to have my logfiles/pidfiles all in the common place, so I change these locations from relative paths (that point to subdirs in /usr/local/etc/nginx/) to absolute paths:

    error_log   /var/log/nginx/error.log notice;
    pid         /var/run/nginx.pid;
    
    http {
        server {
            access_log /var/log/nginx/access.log;
            # rest of config here ...
        }
    }

After that we have to run some simple commands:

    # create nginx subdir
    mkdir -p /var/log/nginx
    # change ownership (must be the same user as nginx process)
    chown -R www:www /var/log/nginx
    # trigger nginx to reload its config
    nginx -t && nginx -s reload

##Inclusion of configs into nginx.conf
You can either copy & paste the content of the various nginx.[app].conf into your /usr/local/etc/nginx.conf or, to keep things a little bit separated, use "include" to link the files into your main nginx.conf like so:

    http {
        server {
            listen 80;
            server_name localhost;
            
            # include external location directives here:
            include /path/to/moinmoin/nginx.moinmoin.conf;
            include /path/to/mantis/nginx.mantis.conf;
            
        }
        
        # include files with own server section here:
        include /path/to/wpad/nginx.wpad.conf;
    }
    
Caution! You have to keep an eye on if the included file has a separate "server" section in it (e.g. like the nginx.wpad.conf).

Now you have to trigger nginx to re-read its configuration files by running

    nginx -t && nginx -s reload

#Minor tweaking
##poudriere build logs (or: view .log files in your browser)
If you serve your poudriere build logs with your nginx installation you will be able to view the nice interface and watch the ports being built but not be able to view your logfiles directly from within your browser. 

Instead you will be prompted to download that .log file from your webserver.

To fix this issue you must modify /usr/local/etc/nginx/mime.types and change line 13 to include "log":

    # diff from mime.types (before and after modification)
    13c13
    <     text/plain                            txt;
    ---
    >     text/plain                            txt log;

After thatbe sure to let nginx reload its configuration:

    root@fbsd # nginx -t && nginx -s reload
