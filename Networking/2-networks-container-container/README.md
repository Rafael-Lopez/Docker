# Networks-demo app
Node app that acts as a web api to get Star Wars info through the https://swapi.dev/ API, and can store favorite movies using MongoDB.
This is a demo to demonstrate how Container to Container communication works.

## Create custom network
```bash
docker network create networks-containers-net
```

## Build image
```bash
docker build -t networks-containers .
```

## Run containers
```bash
docker run -d --name mongo-db --network networks-containers-net mongo
```
```bash
docker run -d --rm --name networks-containers -p 3000:3000 --network networks-containers-net networks-containers
```