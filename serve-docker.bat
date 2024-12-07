REM Stop all running Docker containers
FOR /f "tokens=*" %%i IN ('docker ps -q') DO docker stop %%i

REM Run container with env file and quiet output
docker run --rm -it ^
  -p 8080:8000 ^
  -v %cd%:/docs ^
  --env-file .env ^
  custom-mkdocs-material