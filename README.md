*Disclaimer: This just represents my personal experience and may be outdated or superseded by best-practises from the nginx team or more skilled people. Use at your own risk and - your mileage may vary ;-)*

# nginx-cases
Different scenarios with nginx on FreeBSD.

I want to share my experiences while switching from lighttpd to nginx and setting up 
* various web frameworks like moinmoin-wiki, egroupware, phpMyAdmin, mantis bugtracker, etc.
* static content like wpad.dat
* features like redirect/rewrite to the SSL part of the webserver, except some single urls.

Hint: nginx on FreeBSD uses /usr/local/www/nginx-dist as root path for its web content, but all additional packages like wikis etc. tend to install into /usr/local/www/[appname]. So you need to take care about your document root setting within your app specific location directive in /usr/local/etc/nginx/nginx.conf and all the other settings for PHP, Python, redirections and more.

## sub-directories
* nginx: general nginx configuration files and hints
* helper_files: include some little scripts, e.g. PHP-testfile
* django: some information about how to include a django framework
* moinmoin: MoinMoni wiki configuration
* php: folder with setup for PHP/PHP-fpm
* phpMyAdmin: nginx config
* egroupware: nginx config for EGroupware incl. working CalDAV/CardDAV location directive
* mantis: Mantis BugTracker configuration
* wpad: example how to serve static WPAD/PAC files and redirect to sprecific server

# base system
* FreeBSD 10.1-RELEASE as operating system
* pkg for package installation as long as not stated otherwise
