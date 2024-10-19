## Overview of this assignment

#- Imagine another developer gave you the instruction below, and you'll need to interpret them into what the Dockerfile should contain.
#- Once the Dockerfile builds correctly, start container locally to make sure it works on [http://localhost](http://localhost)
#- Then ensure the image is named properly for your Docker Hub account with a new repository name
#- Then push to Docker Hub, and go to [https://hub.docker.com](https://hub.docker.com) to verify you pushed it correctly
#- Then remove local image from cache (`docker image rm <name>`)
#- Then start a new container from your Hub image, and watch how it auto downloads and runs
#- Test again that it works at [http://localhost](http://localhost)

FROM node:6-alpine
EXPOSE 3000
RUN apk add --no-cache tini
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install && npm cache clean --force
COPY . /usr/src/app
CMD [ "/sbin/tini", "node", "./bin/www" ]
