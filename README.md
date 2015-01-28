# nginx-cases
Different scenarios with nginx on FreeBSD.

I want to share my experiences while switching from lighttpd to nginx and setting up 
* various web frameworks like moinmoin-wiki, egroupware, phpMyAdmin, mantis bugtracker, etc.
* static content like wpad.dat
* features like redirect/rewrite to the SSL part of the webserver, except some single urls.

Hint: nginx on FreeBSD uses /usr/local/www/data as root path for its web content, but all additional packages like wikis etc. install into /usr/local/www/[appname]. So you need to take care about your document root setting within your app specific location directive in /usr/local/etc/nginx/nginx.conf.

# base system
* FreeBSD 10.1-RELEASE as operating system
* pkg for package installation as long as not stated otherwise