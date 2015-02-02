#EGroupware
eGroupware is a integrated suite of web-based applications like calendar, contacts, 
project mangement and a whole lot of modules more. See the official site at http://www.egroupware.org/ for more
information. Is use it as a central contacts and calendar repository (and sync it to my Android devices) 
and as a webmail client.

A tricky part was to get the CalDAV syncing to work, so keep attention at the PHP-block within the nginx.conf.add file.

##Install software

    pkg install nginx php5 egroupware
    
##Configure EGoupware

Follow the web-based installer to customize your EGroupware installation.

##Modify nginx.conf

Add nginx.conf.add into your /usr/local/etc/nginx/nginx.conf with your favorite editor. 
It goes directly into one "server" block.

##Start the services

    /usr/local/etc/rc.d/php-fpm onestart
    /usr/local/etc/rc.d/nginx onestart

Try to browse http://webserver/eg/ to access your EGroupware suite.

##Modify rc.conf

If the above commands ran succesfully and you can browse your egroupware, it is time to make these changes 
permanent. Add rc.conf.add to your /etc/rc.conf to activate your nginx webserver and the php-fpm at boot time.
