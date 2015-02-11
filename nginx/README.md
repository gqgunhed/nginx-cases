#nginx.conf snippets
for inclusion or as hint for different scenarions. Sometimes just a kind of notebook for me.

#Minor tweaking
##poudriere build logs (or: view .log files in your browser)
If you serve your poudriere build logs with your nginx installation you will be able to view the nice interface and watch the ports being built but not be able to view your logfiles directly from within your browser. 

Instead you will be prompted to download that .log file from your webserver.

To fix this issue you must modify /usr/local/etc/nginx/mime.types and change line 13 to include "log":

    # diff from mime.types (before and after modification)
    13c13
    <     text/plain                            txt;
    ---
    >     text/plain                            txt log;

After thatbe sure to let nginx reload its configuration:

    root@fbsd # nginx -t && nginx -s reload
