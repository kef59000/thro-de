## Docker-Befehle

### 1. Build Docker Image

Open Terminal in root of the folder.

```bash
docker build -t website .
```
View Images:
```bash
docker images
```

### 2. Run Docker Image -> Container
```bash
docker run -p 3000:3000 website
```
View running Containers:

```bash
docker ps
```

Website ist auf http://localhost:3000 erreichbar.

### 3. Stop Container
Container-id from docker ps.

```bash
docker stop <container-id>
```

### 4. Run Image with other Port (Portmapping)

docker run -p HOST_PORT:CONTAINER_PORT image_name

```bash
docker run -p 2999:3000 website
```
Website ist auf http://localhost:2999 erreichbar.
