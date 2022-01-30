FROM node
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
EXPOSE 80

# We only want to persist /app/feedback. The /temp folder is only temporary, that's why we don't add it to the VOLUME instruction.
# VOLUME [ "/app/feedback" ]
# This creates an ANONYMOUS volume. Anonymous volumes are destroyed when the container is removed. Therefore, this does not solve
# the issue of persisting data after a container is removed.

# We removed the VOLUME instruction from here. Instead, we use a NAMED volume, which actually persists after container removal.
# To use named volumes, we do include the -v tag in the Docker run command. Example:
# docker run -d --name feedback-app -p 80:80 --rm -v feedback:/app/feedback feedback-app:volumes

CMD [ "node", "server.js" ]