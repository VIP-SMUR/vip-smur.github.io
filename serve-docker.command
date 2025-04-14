#!/bin/bash

# Move to the folder this script is in
cd "$(dirname "$0")"

# Run the container
docker run --rm -it \
  -p 8080:8000 \
  -v "$(pwd)":/docs \
  --env-file .env \
  custom-mkdocs-material
