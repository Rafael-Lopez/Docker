# Python app
An app that generates a random number between the two integers provided by the user.

## Build image
```bash
docker build -t python-app .
```

## Run container
Since the app requires user input, if you do:
```bash
docker run --name python-app python-app 
```
You will an error like this:
```bash
Please enter the min number: Traceback (most recent call last):
  File "/app/rng.py", line 3, in <module>
    min_number = int(input('Please enter the min number: '))
EOFError: EOF when reading a line
```
If you need to provide user input for the app, you can run the container in interactive mode:
```bash
docker run --name python-app -it python-app 
```
This will let you provide the input required by the app so that it can successfully run.

## Start a container
To restart a container that requires user input, you can do:
```bash
docker start -i [CONTAINER_NAME] 
```