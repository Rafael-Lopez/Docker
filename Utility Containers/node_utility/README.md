# Node Utility container
This utility container can be used to generate package.json files for Node projects without having to install Node on your local environment.

## Build image
```bash
docker build -t node-util .
```

## Run container
```bash
docker run --rm -it -v "$(pwd)":/app node-util npm init
```

- Notes
  - We use a bind mount to get access to the package.json file on our local
  - Notice there's no CMD in the Dockerfile. This is because we don't want to specify which command to run when the container starts. Instead, the user can specify what to run in the docker run command. In this case: 'npm init'.
  - We add '-it' to the docker run command because 'npm init' requires some user input. Therefore, we need to run the container in interactive mode.