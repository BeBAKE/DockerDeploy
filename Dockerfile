FROM node:23-alpine

WORKDIR /app

COPY package*.json ./

RUN npm ci --only=production

COPY . .

EXPOSE 5500

CMD ["node","index.js"]

