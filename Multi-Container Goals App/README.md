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