#!/usr/bin/bash
# Synchronize inviztational here
rsync -avzP /mnt/c/Users/AlecW/Documents/Local_Projects/inviztational2024/inviztational2024/ ./public/inviztational2024/
# Synchronize with web server.
rsync -avzP ./public/ alecsalc@alecsalces.com:/home2/alecsalc/public_html --delete --exclude=cgi-bin/ --exclude=cache/ --exclude=galleries/
