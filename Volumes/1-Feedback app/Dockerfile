FROM node
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
EXPOSE 80

# We only want to persist /app/feedback. The /temp folder is only temporary, that's why we don't add it to the VOLUME instruction.
VOLUME [ "/app/feedback" ]
# This creates an ANONYMOUS volume. Anonymous volumes are destroyed when the container is removed. Therefore, this does not solve
# the issue of persisting data after a container is removed.

CMD [ "node", "server.js" ]