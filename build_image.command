#!/bin/bash

# Move to the folder this script is in
cd "$(dirname "$0")"

# Build the image
docker build -t custom-mkdocs-material .