# Use the official Node.js 20 image as the base image
FROM node:20

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install the project dependencies
RUN npm install

# Copy the source code to the working directory
COPY . .

# Expose port 8080 to the outside once the container has launched
EXPOSE 8080

# Define the command to run the app
CMD ["node", "app.js"]
