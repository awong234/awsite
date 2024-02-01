#!/usr/bin/bash
# Synchronize with web server. Don't delete .htaccess and cgi-bin/ because these
# are generated by apache over on the server or something.
rsync -avzP ./public/ alecsalc@alecsalces.com:/home2/alecsalc/public_html --delete --exclude=.htaccess --exclude=cgi-bin/
