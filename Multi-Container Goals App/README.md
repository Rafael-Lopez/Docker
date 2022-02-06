# Multi-Container Goals App
An app that allows users to store and view goals.

## Architecture
Three main building blocks:
- Database: MongoDB
- Backend: Node.js REST API
- Frontend: Single-Page Application with React

### Database Setup
```bash
docker run --name mongo-db --rm -d -p 27017:27017 mongo
```

### Backend
1. Build image
```bash
docker build -t goals-node .
```
2. Run container
```bash
docker run --name goals-backend --rm -d -p 80:80 goals-node
```

### Frontend
1. Build image
```bash
docker build -t goals-react .
```
2. Run container
```bash
docker run --name goals-frontend --rm -d -p 3000:3000 -it goals-react
```

You need to run it in interactive mode. Otherwise, the container starts and stops. 
You need to let the container know that you want to be able to enter commands and interact with it. We're not actually going to do that, but the React project is set up in such a way that if it doesn't receive this input, it immediately stops the server because no one's interested anyways. So we need to add -it to the run command.