# Feedback-ENV app
Same as Feedbak app, but with environment-variable support to specify port.

## Build image
```bash
docker build -t feedback-app:env .
```

## Run container
### Without ENV variable
```bash
docker run -d --rm --name feedback-app -p 80:80 -v feedback:/app/feedback -v ABSOLUTE/PATH/TO/RESOURCE:/app:ro -v /app/node_modules -v /app/temp feedback-app:env
```
### With ENV variable for port
```bash
docker run -d --rm --name feedback-app -p 80:3000 -e PORT=3000 -v feedback:/app/feedback -v ABSOLUTE/PATH/TO/RESOURCE:/app:ro -v /app/node_modules -v /app/temp feedback-app:env
```