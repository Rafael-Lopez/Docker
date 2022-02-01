FROM node
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
# Here, 80 is the default value in case it's not specified in the DOCKER RUN command
ENV PORT 80
EXPOSE $PORT

CMD [ "node", "server.js" ]