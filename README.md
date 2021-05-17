# What is Containerisation Docker

![SCHEME](./docker.png)

- Why docker
- Difference between Docker and VM
- Docker Installation and setup
- Docker hub account and repo
- Docker containers and images
- Building customised images, microservice

## Docker commands:

- `docker --version`
- `docker run hello-world`: to download and run directly the docker
- `docker images`
- `docker rmi hello-world -f`: to force delete it
- `sudo docker pull hello-world`: to download the image but no running. If you want to make sure that it is your image.
- `docker run hello-world`
- `docker ps`: to check the containers
- `docker ps -a`: checking running containers for all

Stages:
- pull
- check the images
- ps to see in the containers exists

To create a docker with a specific image:
- `docker pull ghost`
- `docker images`
- `sudo docker ps`
- `docker run -d -p 2368:2368 ghost`
- go to the browser

To delete a docker:
- `docker ps` and copy de container ID
- `sudo docker rm 4e274a3b2474 -f`: to force

To delete a docker but firt stopping it:

Pull and run:
- `sudo docker run -d -p 88:80 nginx`: it pulled and runned. It is going to use port 88 on our localhost, and it wants to catch the traffic from port 80 which is the one used by default nginx.
- Go the browser `localhost:88`

Go to inside of the docker:
- We need the container ID `docker ps`
- `docker exec -it 19aa73f56a0d sh` to go inside of the shell of the container.
- Inside: `cd /usr/share/nginx/html`, then `apt-get install nano`, go inside `nano index.html` and modify the title.
- Go again to the browser and refresh and boom! You can see the magic. We do not need to restart anything.

## Task

- Create docker hub account and a repo called eng84 on docker hub.
- Build a customised image with the index.html that we created together in the class (In our local machine).
- Push the image to your docker hub repo.

_Solution:_

- How to create an image with the new `index.html` file:

1. Run a docker with nginx server:

`docker run -d -p 88:80 nginx` -> it pulled and runned.

2. Go to your browser: `localhost:88` -> you will see the nginx service.

3. Let's create a new `index.html` in your localhost `sudo nano index.html`:

````
<html>
<head>
<title>HI JOSE</title>
</head>
<body><h1> This file is inside the OS and using docker cp command to copy into nginx container's location docker cp index.html /usr/share/nginx/html/ HELLO JOSE </h1></body>

</html>
````

4. Copy from your local machine to the container:

`docker cp index.html ID_or_name_of_your_docker:/usr/share/nginx/html/index.html`

5. Create an Image from a Cointainer:

So at this point, we’ve updated the contents of a running container and as long as we keep that container around, we don’t need to do anything.

However, we want to know how to save this container as an image so we can make other containers based on this one. 

`docker commit ID_or_name_of_your_docker`

6. Now look at the docker images list:

`docker images`

And tag the new image: `docker tag ID_new_images name_tag`

Or you can do it directly: `docker commit ID_or_name_of_your_docker new_name_image`

7. Stop your actual container and create a new one:

`docker stop ID_or_name_of_your_docker`

`docker rm ID_or_name_of_your_docker`

8. Finally create a new container based on the image we just created and start it:

`docker run --name jose_docker_nginx -d -p 88:80 name_new_image_created`

Check is working:

`docker ps` and go to the browser and enter: `localhost:88` and you will see your new html updated.

- How to push the image to your docker hub repository:

1. Log in: `docker login`

2. Run `docker images` and copy the name of the image that you want to push it.

3. Then we create a new image with a new tag name that should be the name of your account/the name of the repository:

`docker tag new_nginx_jose:latest josetorres31/eng84_jose_nginx:latest`

4. Before pushing see if the new image was created: `docker images`. If everything is right: `docker push josetorres31/eng84_jose_nginx:latest`.

5. Go to your Docker hub account to check that. Then try to pull to see if everything is right -> AMAZING!
