FROM node:lts-buster-slim

# Create app directory
WORKDIR /app

COPY . .

RUN npm install

EXPOSE 3000

CMD ["npm", "start"]