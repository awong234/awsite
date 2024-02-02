#!/usr/bin/bash
# Synchronize with web server.
rsync -avzP ./public/ alecsalc@alecsalces.com:/home2/alecsalc/public_html --delete --exclude=cgi-bin/
