# Basisimage für Container
FROM node:lts-alpine3.19

# Manuelle Installation von Node.js
# From ubuntu:latest
# apt-get update
# apt-get install curl
# # get install script and pass it to execute: 
# curl -sL https://deb.nodesource.com/setup_4.x | bash
# # and install node 
# apt-get install nodejs

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm install

# Copy app files
COPY . .

EXPOSE 3000
CMD [ "node", "index.js" ]