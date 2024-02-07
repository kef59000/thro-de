# Demo: Node.js Backend and Postgres with Docker Compose

This project demonstrates a simple Node.js backend application running with Docker Compose, which also includes a PostgreSQL database.

## Prerequisites

- Docker and Docker Compose installed on your system.
- Basic understanding of Docker, Docker Compose, and Node.js.

## Getting Started

This application is containerized using Docker, and orchestrated using Docker Compose. To get started, follow the steps below.

### Running the Application

1. **Start the Application**:

   - To start all services defined in your `docker-compose.yml` file, run the following command in your terminal:
     ```bash
     docker-compose up
     ```
   - This command starts the containers in the foreground with logs outputting to your terminal. To run them in the background, use:
     ```bash
     docker-compose up -d
     ```

2. **Accessing the Application**:
   - Once the application is running, you can access the Node.js backend at `http://localhost:8080`.
   - The PostgreSQL database is also running and linked to your application, though direct access will depend on the database configuration.

### Stopping the Application

- To stop all running services, use:
  ```bash
  docker-compose down
  ```
  This command stops and removes the containers along with the network created by Docker Compose.

## Additional Information

- The Node.js application is a simple server running with Express.js.
- The Dockerfile for the Node.js app is located in the `backend` directory.
- The PostgreSQL service is set up in the `docker-compose.yml` file and accessible to the Node.js app via the `postgres` hostname.
