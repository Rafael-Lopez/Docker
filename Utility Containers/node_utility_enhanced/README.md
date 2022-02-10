# Node Utility container (enhanced)
This utility container can be used to generate package.json files for Node projects without having to install Node on your local environment.

## Build image
```bash
docker build -t node-util-enhanced .
```

## Run container
```bash
docker run --rm -it -v "$(pwd)":/app node-util-enhanced init
```

- Notes
  - We use a bind mount to get access to the package.json file on our local
  - Since we added ENTRYPOINT in the Dockerfile, there's no need to run 'npm init' after the image name in the docker run command. All we need to do is add 'init'. And it's the same for all other npm commands we want to run.
  - We add '-it' to the docker run command because 'npm init' requires some user input. Therefore, we need to run the container in interactive mode.

## docker-compose
```bash
docker-compose run --rm npm init
```  
- Notes
  - ```'docker-compose up'``` is really meant to bring up services defined in a docker-compose file. And here we're typically talking about application containers, containers that are started and then should continue running. Utility containers don't necessarily want to continue running.
  - ```'docker-compose run'``` allows us to run a single service from a yml file with multiple services. Here we have only one, but if we had multiple services, we could target a single service by the service name. In this case, ```'npm'```, because that's the name of ours service defined in the docker-compose file.
  - When we start services with ```'docker compose up'```, they are automatically deleted, when we do ```'docker-compose down'```. However, with 'docker-compose run', there is no up and down. A container starts, does its thing, and once the command finishes, it shuts down, but it's not removed automatically. We simply add ```'--rm'``` as usual, to remove the container once it stops.