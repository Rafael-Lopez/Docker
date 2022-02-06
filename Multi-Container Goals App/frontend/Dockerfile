FROM node:14 
#  Use node 14 version since the latest one generates this error: ERR_OSSL_EVP_UNSUPPORTED

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "start"]