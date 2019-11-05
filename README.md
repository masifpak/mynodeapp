


Clone repository and go inside the directory and run the following commands in sequence

The following command will use default Dockerfile and build the image

docker build -t masifpak80/mynodeapp:v1 .

In this command we are tagging the image so that we can push on dockerhub

docker tag masifpak80/mynodeapp:v1 docker.io/masifpak80/mynodeapp:latest

Login using your credentials on dockerhub.

docker login

docker push docker.io/masifpak80/mynodeapp:latest


For using already build image, pull the image

docker pull masifpak80/mynodeapp:latest

docker run --name mynodeapp -h mynodeapp --env PORT=3306 -p 3306:3306 -d masifpak80/mynodeapp:latest
