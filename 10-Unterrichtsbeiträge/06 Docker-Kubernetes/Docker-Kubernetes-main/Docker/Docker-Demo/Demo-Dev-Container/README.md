# Exercise Dev Container

During this exercise you will create a dev container in Visual Studio Code and create a React app inside the dev container.

## Prerequisites

- [Docker](https://www.docker.com/products/docker-desktop)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Visual Studio Code Dev Containers Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Create Dev Container

1. Open the project in Visual Studio Code
2. Open the command palette (Ctrl+Shift+P)
3. Select `Dev Containers: Open Folder in Container...`
4. Select the folder `Exercise-Dev-Container` containing this README.md file
5. Choose `Ubuntu` as container configuration template
6. Choose `jammy (default)` as Ubuntu version
7. Select feature `Node.js (via nvm), yarn and pnpm`
8. Optional: Select additional features to further customize your dev container
9. Wait for the dev container to build

## Create React App

1. Open the command palette (Ctrl+Shift+P)
2. Select `Terminal: Create New Integrated Terminal`
3. Run `npx create-react-app react-app`
4. Run `cd react-app`
5. Run `npm start`

## Modify React App

1. Open the file `react-app/src/App.js`
2. Modify the text inside the `<p>` tag
3. Save the file
4. Refresh the browser to see the changes
