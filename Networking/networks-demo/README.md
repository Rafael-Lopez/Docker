# Networks-demo app
Node app that acts as a web api to get Star Wars info through the https://swapi.dev/ API, and can store favorite movies using MongoDB.
This is a demo to demonstrate how networking works in Docker:
- Container to WWW
- Container to localhost
- Container to Container  

## Build image
```bash
docker build -t networks-demo .
```

## Run container
```bash
docker run -d --rm --name networks-demo -p 3000:3000 networks-demo
```