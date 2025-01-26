#!/usr/bin/bash
rsync -avzP /mnt/c/Users/AlecW/OneDrive/Pictures/website-photos/ alecsalc@alecsalces.com:/home2/alecsalc/public_html/photography/galleries --delete --exclude=cache/ --exclude=*.psd
