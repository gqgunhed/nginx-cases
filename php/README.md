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

##Diffs

    diff /usr/local/etc/php-fpm.conf.default /usr/local/etc/php-fpm.conf
