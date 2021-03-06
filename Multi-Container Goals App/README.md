# Multi-Container Goals App
An app that allows users to store and view goals.

## Architecture
Three main building blocks:
- Database: MongoDB
- Backend: Node.js REST API
- Frontend: Single-Page Application with React

### App Network
```bash
docker network create goals-net
```

### Database Setup
```bash
docker run --name mongo-db --rm -d --network goals-net -e MONGO_INITDB_ROOT_USERNAME=admin -e MONGO_INITDB_ROOT_PASSWORD=admin -v goals-app-data:/data/db mongo
```

### Backend
1. Build image
```bash
docker build -t goals-node .
```
2. Run container
```bash
docker run --name goals-backend -v "$(pwd)":/app -v logs:/app/logs -v /app/node_modules -d --rm -p 80:80 --network goals-net -e MONGODB_USERNAME=admin -e MONGODB_PASSWORD=admin goals-node
```
- Notes
  - We need to expose port 80 so that the frontend can talk to the backend.
  - For Nodemon to work when running Docker on Windows, you need to replace "nodemon app.js" with "nodemon -L app.js" in package.json. Basically, when using WSL 2, Windows doesn't forward filesystem events to WSL, so Nodemon doesn't get notified of file changes happening in Windows. If you modify your js files from inside a WSL shell, nodemon should actually pick up on the changes and restart the app. To solve this, we can use polling to get hot reload when editing files from Windows: https://github.com/remy/nodemon#application-isnt-restarting

### Frontend
1. Build image
```bash
docker build -t goals-react .
```
2. Run container
```bash
docker run --name goals-frontend -v "$(pwd)":/app/src --rm -d -p 3000:3000 -it goals-react
```
- Notes
  - You need to run it in interactive mode. Otherwise, the container starts and stops. 
You need to let the container know that you want to be able to enter commands and interact with it. We're not actually going to do that, but the React project is set up in such a way that if it doesn't receive this input, it immediately stops the server because no one's interested anyways. So we need to add -it to the run command.
   - React code doesn't run in the container, it runs in the browser. Therefore, we cannot take advantage of Docker's'automatic host IP resolving. That's why, in the code, we still have localhost. The part that does run in the container, the dev server, does not need to talk to other containers, so we don't need to run the React app in the 'goals-net' network.

