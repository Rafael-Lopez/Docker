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