




docker build -t masifpak80/mynodeapp:v1 .

docker tag masifpak80/mynodeapp:v1 docker.io/masifpak80/mynodeapp:latest

docker push

docker run --name mynodeapp -h mynodeapp --env PORT=3306 -p 3306:3306 -d masifpak80/mynodeapp:latest
