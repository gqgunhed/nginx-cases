#CalDAV
Your contacts and calendar from EGroupware can be synced to Thunderbird (via the Lightning Add-on) or mobile devices like Android via the CalDAV protocol.

##Android Client
For my Android devices I use DAVDroid to sync contacts and calendar. See the official site for download links and more 
information: https://davdroid.bitfire.at/what-is-davdroid

Your DAVDroid must be configured to talk to your EGroupware installation at the following location:

    http://webserver/eg/groupdav.php
    
* HTTP or HTTPS: defined by the setting of your webserver and if you can integrate your SSL-certificate into your Android device's security setting (see https://davdroid.bitfire.at/faq --> e.g. What does "Untrusted certificate in certificate path" mean?). 
* username+password: The same credentials you use to log into your EGroupware webinterface. This is why you should use HTTPS

Where "webserver" is the FQDN of your installation and "eg" is your installation/serving location obviously ;-)
