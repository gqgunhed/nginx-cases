#PHP5 settings

General information about setting up PHP/php-fpm.

##Installation
As php-fpm is now included by default one does no longer need a separat spawn-fcgi package.

    pkg install php5
    cp /usr/local/etc/php.ini-production /usr/local/etc/php.ini
    cp /usr/local/etc/php-fpm.conf.default /usr/local/etc/php-fpm.conf
    vi /usr/local/etc/php.ini
    vi /usr/local/etc/php-fpm.conf

###Start the service
    
    /usr/local/etc/rc.d/php-fpm onerestart
    
or add entries to your /etc/rc.conf

    echo 'php_fpm_enable="YES"' >> /etc/rc.conf

###Check socket presence

When running

    sockstat -l

you should see some entries for your php-fpm processes like:

    root@fbsd: # sockstat -l
    USER     COMMAND    PID   FD PROTO  LOCAL ADDRESS         FOREIGN ADDRESS      
    www      nginx      1591  6  tcp4   *:80                  *:*
    www      php-fpm    1525  0  stream /tmp/php-fpm.sock
    www      php-fpm    1524  0  stream /tmp/php-fpm.sock
    root     php-fpm    1523  7  stream /tmp/php-fpm.sock

Or run
     
     ps aux -d | grep php

##Diffs

    diff /usr/local/etc/php-fpm.conf.default /usr/local/etc/php-fpm.conf
