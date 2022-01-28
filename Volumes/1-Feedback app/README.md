# Feedback app
An app that allows users to enter feedback. The app saves the feedback in the /temp folder, and in the /feedback folder if a file with the same name does not exist.

NOTE: the filename is taken from the 'Title' field in the feedback form.

Text files generated, which contain the feedback provided, can be seen in the browser by going to localhost:80/feedback/FILE_NAME.txt

## Build image
```bash
docker build -t feedback-app .
```

## Run container
```bash
docker run --name feedback-app -p 80:80 -d feedback-app 