# We need to use nginx official image as our base image
# We will use a key word called FROM

FROM nginx
# Here we using nginx official image as our base image

LABEL MAINTAINER = eng84jose
# Using label is a good practice but optional

COPY app1 /usr/share/nginx/html
#copying our app1 folder from our OS to default index.html location

EXPOSE 80
# Expose is the keyword to use to expose the required port for the base image

CMD ["nginx", "-g", "daemon off;"]
# CMD will execute the command in this case as this information/instructions taken from the official image
