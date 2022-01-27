# Answers
## 1) Create appropriate images for both apps (two separate images!).
Dockerfiles added to each project
```bash
cd node-app
docker build -t nodejs-demo .
cd ..
cd python-app
docker build -t python-demo .
```

## 2) Launch a container for each created image, making sure, that the app inside the container works correctly and is usable.
```bash
docker run -d -p 3000:3000 nodejs-demo
docker run -it python-demo  
```

## 3) Re-create both containers and assign names to both containers.
```bash
docker stop nodejs-demo python-demo
docker rm nodejs-demo python-demo
docker run --name nodejs-demo -d -p 3000:3000 nodejs-demo
docker run --name python-demo -it python-demo  
```

## 4) Clean up (remove) all stopped (and running) containers, clean up all created images.
```bash
docker stop nodejs-demo python-demo
docker rm nodejs-demo python-demo
docker image rm nodejs-demo python-demo
```

## 5) Re-build the images - this time with names and tags assigned to them.
```bash
cd node-app
docker build -t nodejs-demo:latest .
cd ..
cd python-app
docker build -t python-demo:latest .
```

## 6) Run new containers based on the re-built images, ensuring that the containers are removed automatically when stopped.
```bash
docker run --name nodejs-demo -d -p 3000:3000 -rm nodejs-demo
docker run --name python-demo -it -rm python-demo  
```