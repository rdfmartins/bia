versao=$(git rev-parse --short=7 HEAD)
echo TAG=$versao > .env
docker compose -f compose-com-eb.yml config >> compose-eb-dev.yml
mv compose-eb-dev.yml docker-compose.yml