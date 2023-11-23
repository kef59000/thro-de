# Ziel der Übung

Das Ziel dieser Übung ist es, ein Mono-Repository einzurichten, welches drei einfache Services in TypeScript beinhaltet. Diese Services sollen pnpm als Package Manager verwenden, aber in unterschiedlichen Technologien gebaut sein.

## Vorbereitung:

Installation von Node.js und pnpm

### Node.js installieren:

Für die Übung benötigen Sie node.js. Auf der offiziellen Website können Sie sich die neuste Version herunterladen.

https://nodejs.org/en

### pnpm installieren:

Nach der Installation von Node.js öffnen Sie die Kommandozeile und führen Sie den Befehl aus:

`npm install -g pnpm`

## Schritte zur Einrichtung des Mono-Repositories

1.  GitLab Repository anlegen

    Erstellen Sie ein neues Repository, indem Sie auf "Create New" klicken und die notwendigen Details ausfüllen. (Wichtig hierbei ist es als persönliches Projekt zu erstellen.)

2.  Lokales Repository klonen

    Klonen Sie das Repository auf Ihren Computer mit:
    `git clone <Repository-URL>`.

    Wechseln Sie in das Repository-Verzeichnis: `cd <Repository-Name>`

3.  Mono-Repository Struktur erstellen

    Führen Sie `pnpm init` aus.
    Erstellen Sie einen Ordner für die Services:
    `mkdir services`.
    Erstellen Sie in der root Ebene des Projektes eine Datei mit dem Namen `pnpm-workspace.yaml`.
    Fügen Sie folgende Zeilen Code in diese Datei ein.

    ```
    packages:
      - "services/*"

    ```

4.  TypeScript und Hello World Services einrichten

    Führen Sie im `services` Ordner folgende Befehle aus.

    ```
    cd services
    pnpm create vite service1 --template vanilla-ts
    cd ../
    pnpm install
    npm pkg set scripts.service1="pnpm --filter service1"
    ```

    ```
    cd services
    pnpm create vite service2 --template react-ts
    cd ../
    pnpm install
    npm pkg set scripts.service2="pnpm --filter service2"
    ```

    ```
    pnpm i @nestjs/cli
    cd services
    nest new service3
    cd ../
    pnpm install
    npm pkg set scripts.service3="pnpm --filter service3"
    ```

5.  Änderungen commiten und pushen

    Erstellen Sie bevor Sie ihre Änderungen pushen eine `.gitignore` Datei und fügen Sie die `node_modules` hinzu.

    Fügen Sie alle neuen Dateien zum Git hinzu:
    `git add .`

    Commiten Sie die Änderungen:

        `git commit -m "Initial setup of mono-repository with TypeScript services"`

    Pushen Sie die Änderungen zum remote Repository:

    `git push origin master`

## Testen der Services

Nachdem Sie jetzt die drei verschiedenen Services erstellt haben, können Sie diese jetzt auch durch `pnpm service1 dev`, `pnpm service2 dev` oder auch `pnpm service3 start:dev` starten.
Hierbei wird das Kommando das auf root Ebene abgeschickt wird, im Ordnerverzeichnis des Services ausgeführt.
Die verfügbaren Kommandos stehen hierbei in der jeweiligen `package.json`.

### Herausforderungen

Ändern Sie die Ports der Services 2 und 3 und bringen sie alle drei Services gleichzeitig zum laufen.

Erstellen Sie ein `pnpm` Kommando in der `package.json` File um alle Services durch ein Kommando in der root Ebene gleichzeitig zu starten.

# Shared Pipelines

In diesem Abschnitt werden Sie ein Repository mit einer Shared Pipeline erstellen und diese in ihr Mono-Repository Projekt einbinden.

## Schritte zur Erstellung der shared Pipeline

1.  Git Repository für Shared Pipeline anlegen  
    Erstellen Sie ein neues Git Repository mit einem beliebigen Namen. (Wichtig hierbei ist es als persönliches Projekt zu erstellen.)

2.  Lokales Repository klonen
    Klonen Sie das Repository auf Ihren Computer mit:
    `git clone <Repository-URL>`.

    Wechseln Sie in das Repository-Verzeichnis: `cd <Repository-Name>`

3.  Erstellen der shared Pipeline  
    Erstellen Sie in diesem Repository einen Ornder mit dem Namen `shared` und erstellen Sie in diesem Ornder eine Datei mit dem Namen `shared-pipeline.yml`.
    Fügen Sie in diese Datei folgenden Inhalt ein:

    ```
    stages:
    - print_hello

    print_hello:
    stage: print_hello
    script:
        - echo "Hello from the Shared Pipeline!"

    ```

4. Shared Pipeline einbinden

   Erstellen Sie in Ihrem Mono-Repository eine `.gitlab-ci.cml` Datei und fügen Sie folgenden Code ein:

    ```
    include:
    - project: "GitLabNutzerName/SharedPipelineProjectUrl"
        ref: main
        file: "shared/shared-pipeline.yml"
    ```

5. Änderungen Pushen

   Jetzt müssen Sie alle Änderungen commiten und pushen. Wichtig hierbei ist es zu berücksichtigen, dass die Shared Pipeline zuerst gepusht werden muss, damit sie korrekt geladen werden kann.

### Falls Sie schnell fertig sind

https://learngitbranching.js.org/?locale=de_DE
