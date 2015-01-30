#Mantis Bug Tracker
I prefer MantisBT (official site: http://www.mantisbt.org/) because it is easy to maintain and covers all my needs.
This guide covers instructions how to set nginx and PHP-fpm up to serve a Mantis Bug Tracker. 
It does not cover (atm) setting up mysql-server or the MantisBT itself in-depth, as this repo is focused on the nginx webserver and the other web-components.

##Install software

    pkg install nginx mantis php5 mysql55-server
    

##Modify settings

    cp /usr/local/etc/php.ini-production /usr/local/etc/php.ini  

##Start the services

    /usr/local/etc/rc.d php-fpm start
    /usr/local/etc/rc.d nginx start
    
##Modify rc.conf

If the above commands ran succesfully and you can browse your MantisBT, 
it is time to make these changes permanent. Add rc.conf.add to your 
/etc/rc.conf to activate your nginx webserver and the php-fpm socket at boot time.



#Additional helper functions

### diffs

    diff /usr/local/etc/php-fpm.conf.default /usr/local/etc/php-fpm.conf
    diff /usr/local/etc/php.ini-production /usr/local/etc/php.ini
