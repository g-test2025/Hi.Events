FROM node:alpine AS node-frontend


WORKDIR /app/frontend

RUN apk add --no-cache yarn

COPY ./frontend/package.json ./frontend/yarn.lock ./

COPY ./frontend .

RUN yarn install && yarn build

COPY render-start.sh /render-start.sh
RUN chmod +x /render-start.sh

CMD ["/render-start.sh"]

