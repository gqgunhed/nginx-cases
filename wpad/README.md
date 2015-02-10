#WPAD configuration
WPAD is a hostname used by brosers/operating systems to get information about the proxy settings for this network.

If you set your browsers proxy settings to "determine automatically" it will send a request for "/wpad.dat" to a webserver called "wpad". The returned JavaScript file sets the proxy variables within the browser.

##Pre-requisites
You need a DNS-entry resolving "wpad" to your nginx-webserver, either via a DNS-server or an entry in your /etc/hosts.

#nginx configuration
We will use a separate server entry (not a location directive) to serve a static wpad.dat file. And we will redirect all request to out nginx-instance called "wpad" to the file "wpad.dat".

##nginx.wpad.conf
This file contains the server block to serve under the name of "wpad":

    server {
        server_name wpad;
        root /usr/local/www/wpad;

        location / {
            # redirect _every_ request to wpad-hostname to wpad.dat
            return 301 http://wpad/wpad.dat;
        }
        location ~ ^/wpad.dat$ {
            expires 60s;
        }
    }

Now put your wpad.dat JavaScript file into the folder /usr/local/www/wpad and you are good to go.

You can watch the redirection at work with "curl" and its "-L -I" parameter (-L follows any redirects, -I shows the HTTP headers):

    [user@fbsd ~]$ curl -L -I http://wpad/index.html
    HTTP/1.1 301 Moved Permanently
    Server: nginx/1.6.2
    Date: Tue, 10 Feb 2015 11:44:32 GMT
    Content-Type: text/html
    Content-Length: 184
    Connection: keep-alive
    Location: http://wpad/wpad.dat
    
    HTTP/1.1 200 OK
    Server: nginx/1.6.2
    Date: Tue, 10 Feb 2015 11:44:32 GMT
    Content-Type: application/octet-stream
    Content-Length: 17
    Last-Modified: Tue, 10 Feb 2015 11:08:45 GMT
    Connection: keep-alive
    ETag: "54d9e6bd-11"
    Expires: Tue, 10 Feb 2015 11:45:32 GMT
    Cache-Control: max-age=60
    Accept-Ranges: bytes

##redirecting from other nginx server_names
If you want to redirect any request for "wpad.dat" or "proxy.pac" sent to your default webserver to your wpad-instance use the following location directive within your default webserver block:

    location ~ ^/(wpad\.dat|proxy\.pac)$ {
        return 301 http://wpad/wpad.dat;
    }


#Weblinks
Some links for more information about proxy autoconfiguration and samples:
* https://en.wikipedia.org/wiki/Web_Proxy_Autodiscovery_Protocol
* https://calomel.org/proxy_auto_config.html
