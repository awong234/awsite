#!/bin/bash

ssh alecsalc@alecsalces.com 'find public_html/static/photographs -type d' | awk -f ./scripts/make_photo_paths.awk
