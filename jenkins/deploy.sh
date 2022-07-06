echo testeeeeeeeeeeeeee

docker build -t projeto1 .
docker run --name projeto1 -d -p 8082:8082 projeto1