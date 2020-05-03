#!/bin/bash

ssh alecsalc@alecsalces.com 'pushd public_html > /dev/null; find static/photographs -type d' | awk -f ./scripts/make_photo_paths.awk > static/photo_paths.txt
