# Feedback-ENV app
Same as Feedbak-ENV-FILE app, but with build argument support to specify port when building an image.

## Build image
### Without build ARG
```bash
docker build -t feedback-app:build-arg .
```
### With build ARG
```bash
docker build -t feedback-app:build-arg --build-arg DEFAULT_PORT=3000 .
```

## Run container
### When building image without ARG
```bash
docker run -d --rm --name feedback-app -p 80:80 -v feedback:/app/feedback -v ABSOLUTE/PATH/TO/RESOURCE:/app:ro -v /app/node_modules -v /app/temp feedback-app:build-arg
```
### When building image with ARG
```bash
docker run -d --rm --name feedback-app -p 80:3000 --env-file .env -v feedback:/app/feedback -v ABSOLUTE/PATH/TO/RESOURCE:/app:ro -v /app/node_modules -v /app/temp feedback-app:build-arg
```