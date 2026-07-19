#!/usr/bin/bash
# Synchronize with web server.
rsync -avzP ./public/ alecsalc@alecsalces.com:/home2/alecsalc/public_html --delete --exclude=cgi-bin/ --exclude=cache/ --exclude=galleries/
# Send inviztational to website
rsync -avzP /mnt/c/Users/AlecW/Documents/Local_Projects/inviztational2024/inviztational2024/ alecsalc@alecsalces.com:/home2/alecsalc/public_html/inviztational2024/
