#!/bin/bash

find static/photographs -type d | awk -f ./scripts/make_photo_paths.awk > static/photo_paths.txt
