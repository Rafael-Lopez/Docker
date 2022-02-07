FROM node

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 80
# Random
ENV MONGODB_USERNAME=admin
ENV MONGODB_PASSWORD=admin

CMD [ "npm", "start" ]