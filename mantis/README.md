#Mantis Bug Tracker
I prefer MantisBT because it is easy to maintain and covers all my needs.

##Install software

    pkg install nginx mantis php5
  
##Modify settings

    cp /usr/local/etc/php.ini-production /usr/local/etc/php.ini  

##Start the services

    /usr/local/etc/rc.d php-fpm start
    /usr/local/etc/rc.d nginx start
    
##Modify rc.conf
If the above commands ran succesfully and you can browse your MantisBT, 
it is time to make these changes permanent. Add rc.conf.add to your 
/etc/rc.conf to activate your nginx webserver and the php-fpm socket at boot time.
