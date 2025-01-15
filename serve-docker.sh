# First, build the image
docker build -t custom-mkdocs-material .

# Then run it
docker run --rm -it \
  -p 8080:8000 \
  -v $(pwd):/docs \
  --env-file .env \
  custom-mkdocs-material