# Feedback app
An app that allows users to enter feedback. The app saves the feedback in the /temp folder, and in the /feedback folder if a file with the same name does not exist.

NOTE: the filename is taken from the 'Title' field in the feedback form.

Text files generated, which contain the feedback provided, can be seen in the browser by going to localhost:80/feedback/FILE_NAME.txt

## Build image
```bash
docker build -t feedback-app .
```

## Run container
### Basic version
```bash
docker run --name feedback-app -p 80:80 -d --rm feedback-app
```
### With named volume to persist data
```bash
docker run --name feedback-app -p 80:80 -d --rm -v feedback:/app/feedback feedback-app
```
### With named volume to persist data and bind mount to mount directory on the host machine into the container
```bash
docker run --name feedback-app -p 80:80 -d --rm -v feedback:/app/feedback -v ABSOLUTE/PATH/TO/RESOURCE:/app -v /app/node_modules feedback-app
```
* By using a bind mount, we can mount the folder with the source code into the container, which allows us to update the app without having to build a new image every time we make code changes.
* "-v ABSOLUTE/PATH/TO/RESOURCE:/app" does the bind mount. We are mounting the entire /app folder.
* "-v /app/node_modules feedback-app" fixes the issues we cause when mounting the /app folder. Explanation: 
  * In the Dockerfile, we copy the entire /app folder into the container. We then run "npm install", which installs all Node dependencies. This also creates a "node_modules" folder with all the dependencies installed. 
  * Now, when we mount /app, we override the /app folder created in the container by the COPY command in the Dockerfile, which means no "node_modules" directory, since we don't have it locally. 
  * By adding "-v /app/node_modules feedback-app" to the run command, we create an anonymus volume that prevents the bind mount from removing the "node_modules" folder. 
  * Notice we have several -v options in the run command, Docker always evaluates all volumes you are setting on a container, and if there are clashes, the longer internal path wins. For example, here we have a clash, we have "/app" volume which is bound to something, and we have an "app/node_modules" volume, which is also bound to something. Docker sees that we have some volume mapped to the "/app" folder, and some volume to the "app/node_modules" folder. Then, the rule is: the most specific path wins. That means we can still bind to the app folder, but the node_modules folder inside of the app folder, will survive.

## Note
Dummy.txt files were simply added to have the /feedback and /temp folders committed. Empty folders are not added to GitHub.