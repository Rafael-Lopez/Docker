# Node Utility container (enhanced)
This utility container can be used to generate package.json files for Node projects without having to install Node on your local environment.

## Build image
```bash
docker build -t node-util-enhanced .
```

## Run container
```bash
docker run -it -v "$(pwd)":/app node-util-enhanced init
```

- Notes
  - We use a bind mount to get access to the package.json file on our local
  - Since we added ENTRYPOINT in the Dockerfile, there's no need to run 'npm init' after the image name in the docker run command. All we need to do is add 'init'. And it's the same for all other npm commands we want to run.
  - We add '-it' to the docker run command because 'npm init' requires some user input. Therefore, we need to run the container in interactive mode.