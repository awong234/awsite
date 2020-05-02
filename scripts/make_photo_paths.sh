#!/bin/bash

find static/photographs -type d | awk -f ./static/make_photo_paths.awk