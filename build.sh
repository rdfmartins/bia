versao=$(git rev-parse --short=7 HEAD)
echo "Versão: $versao"
aws ecr get-login-password --region us-east-1 --profile Rodolfo| docker login --username AWS --password-stdin 264642482083.dkr.ecr.us-east-1.amazonaws.com
docker build -t bia .
docker tag bia:latest 264642482083.dkr.ecr.us-east-1.amazonaws.com/bia:$versao
docker push 264642482083.dkr.ecr.us-east-1.amazonaws.com/bia:$versao
./gerar_compose.sh
rm -f bia-*.zip
zip -r bia-$versao.zip docker-compose.yml
rm .env
git checkout -b release-$versao
echo "Versão $versao deployada com sucesso"