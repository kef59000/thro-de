# Aufgabe: Applikation Containerisieren "react-express-mongodb"

## Voraussetzungen

- [Docker](https://www.docker.com/products/docker-desktop)
- [Visual Studio Code](https://code.visualstudio.com/)

## Beschreibung

Der Ordner react-express-mongodb enthält ein fertiges Code-Projekt. Wie der Name schon sagt, besteht das Projekt aus drei Services: Einem Frontend mit React, einem Backend mit Express und einer MongoDB Datenbank. Ziel des Arbeitsblattes ist es, die Services zu containerisieren und die gesamte Anwendung mit dem Befehl "docker-compose up" zu starten.

## Aufgabe 1: Dockerfiles erstellen

### Frontend (React-Service)

Erstelle ein Dockerfile für den React-Service. 
([Frontend Dockerfile](./react-express-mongodb/frontend/Dockerfile))

- Das React Frontend läuft auf Port 3000


### Backend (Express-Service)

Erstelle ein Dockerfile für den Express-Service. ([Backend Dockerfile](./react-express-mongodb/backend/Dockerfile))

- Das Express Backend läuft auf Port 3000

<details>
  <summary>Tipps (Aufbau Dockefile)</summary>

- Ein Node image wird für das Frontend und Backend benötigt
- Erstelle Workdir
- Kopiere Files
- Dependencies installieren
- Port exposen
- Entrypoint: Service starten

</details>


## Aufgabe 2: Docker Compose Datei erstellen

Erstelle eine Docker Compose Datei, um alle Services als Container zu starten. ([docker-compose.yaml](./react-express-mongodb/docker-compose.yaml))

Die Einstellung ("proxy": "http://backend:3000/") in der package.json des Frontend Service ermöglicht es dem Frontend, Anfragen nahtlos an den Backend Service weiterzuleiten, indem das interne Netzwerk von Docker Compose genutzt wird. Dadurch muss der Port vom Backend nicht nach außen geleitet werden.

### Frontend 

- Das Frontend mapped seinen Port 3000 nach außen, um außerhalb des Containers erreichbar zu sein
- Das Frontend startet nach dem Backend

### Backend

- Das Backend startet nach der Datenbank

### DB

- MongoDB benötigt ein Volume, um Daten persistent zu speichern. "./data:/data/db"

<details>
  <summary>Hinweise (Aufbau docker-compose)</summary>

- "context:" wird im build Abschnitt benötigt, um zu beschreiben, wo sich die Dockerfile befindet, mit der das Docker Image gebaut werden soll
- Ein Beispielimage für MongoDB: (image: mongo:4.2.0)
- "depends_on:" wird benötigt um Services nacheinander zu starten

</details>