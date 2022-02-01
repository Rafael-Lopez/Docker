# Feedback-ENV app
Same as Feedbak app, but with environment-variable support and .env file to specify port.

## Build image
```bash
docker build -t feedback-app:env-file .
```

## Run container
### Without ENV variable
```bash
docker run -d --rm --name feedback-app -p 80:80 -v feedback:/app/feedback -v ABSOLUTE/PATH/TO/RESOURCE:/app:ro -v /app/node_modules -v /app/temp feedback-app:env-file
```
### With env file for port
```bash
docker run -d --rm --name feedback-app -p 80:3000 --env-file .env -v feedback:/app/feedback -v ABSOLUTE/PATH/TO/RESOURCE:/app:ro -v /app/node_modules -v /app/temp feedback-app:env-file
```

## Environment Variables & Security
One important note about environment variables and security: depending on which kind of data you're storing in your environment variables, you might not want to include the secure data directly in your Dockerfile.

Instead, go for a separate environment variables file which is then only used at runtime (i.e. when you run your container with docker run).

Otherwise, the values are "baked into the image" and everyone can read these values via docker history <image>.

For some values, this might not matter but for credentials, private keys etc. you definitely want to avoid that!

If you use a separate file, the values are not part of the image since you point at that file when you run docker run. But make sure you don't commit that separate file as part of your source control repository, if you're using source control.