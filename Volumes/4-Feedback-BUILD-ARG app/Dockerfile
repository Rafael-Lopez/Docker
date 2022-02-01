FROM node
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .

# Notice the position of ARG and ENV. These two instructions add layers, and since we don't need 
# to run nmp install again if we change either of those values, we put them after npm install, to optimize.

# Here, 80 is the default value in case it's not specified in the DOCKER BUILD command
ARG DEFAULT_PORT=80
# Here, 80 is the default value in case it's not specified in the DOCKER RUN command
ENV PORT $DEFAULT_PORT
EXPOSE $PORT

CMD [ "node", "server.js" ]