#!/bin/bash

find ../static/photographs -type d | awk -f ./make_photo_paths.awk
