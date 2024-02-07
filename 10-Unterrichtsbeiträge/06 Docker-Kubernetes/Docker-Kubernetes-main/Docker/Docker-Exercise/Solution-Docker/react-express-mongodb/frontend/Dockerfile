# Create image based on the official Node image from dockerhub
FROM node:lts-buster-slim

# Create app directory
WORKDIR /app

# Copy all
COPY . .

# Install app dependencies
RUN npm install

# Expose the port the app runs in
EXPOSE 3000

# Serve the app
CMD ["npm", "start"]
