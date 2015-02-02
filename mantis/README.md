#Mantis Bug Tracker
I prefer MantisBT (official site: http://www.mantisbt.org/) because it is easy to maintain and covers all my needs.
This guide covers instructions how to set up nginx and PHP-fpm to serve a Mantis Bug Tracker. 
It does not cover (atm) setting up mysql-server or the MantisBT itself in-depth, as this repo is focused on the nginx webserver and the other web-components.

##Install software

    pkg install nginx mantis php5 mysql55-server
    

##Modify settings

    # /usr/local/etc/php.ini gets included by /usr/local/etc/php-fpm.conf
    cp /usr/local/etc/php.ini-production /usr/local/etc/php.ini
    vi /usr/local/etc/php.ini
    vi /usr/local/etc/php-fpm.conf
    
Within your php.ini you must set your timezone, e.g. "Europe/Berlin". Otherwise you will get a warning during the web-based install.

php-fpm.conf should be changed at least to only allow connections from localhost. Default is to allow connections from any IP address which is not a good idea.

##Start the services

    /usr/local/etc/rc.d php-fpm onestart
    /usr/local/etc/rc.d nginx onestart

#Customize MantisBT
Now browse to your webserver at http://webserver/mantis/index.php and you will get redirected to the web-based installer at http://webserver/mantis/admin/install.php. Follow the on-screen instructions, connect it to your
database.
    
##Modify rc.conf

If the above commands ran succesfully and you can browse your MantisBT, 
it is time to make these changes permanent. Add rc.conf.add to your 
/etc/rc.conf to activate your nginx webserver and the php-fpm socket at boot time.

###Cleaning up
After having MantisBT up and running it complains about the admin directory still being there. So remove it by running:

    rm -R /usr/local/www/mantis/admin/


#Additional helper functions

### diffs

    diff /usr/local/etc/php-fpm.conf.default /usr/local/etc/php-fpm.conf
    diff /usr/local/etc/php.ini-production /usr/local/etc/php.ini
