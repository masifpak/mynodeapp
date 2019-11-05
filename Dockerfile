FROM node:13.0.1-alpine as myapp
RUN apk add iputils nano bash git wget curl
WORKDIR /the-example-app.nodejs
#RUN git clone https://github.com/contentful/the-example-app.nodejs.git
COPY package.json .
RUN npm install -g contentful-cli
RUN npm install
COPY . .

#USER node
#EXPOSE 3000
FROM node:13.0.1-alpine
RUN apk add iputils nano bash git wget curl
WORKDIR /the-example-app.nodejs
COPY . .
COPY --from=myapp /usr/local/lib/node_modules/ /usr/local/lib/node_modules/
COPY --from=myapp /the-example-app.nodejs/node_modules /the-example-app.nodejs/node_modules/
#COPY --from=myapp /the-example-app.nodejs/dist /the-example-app.nodejs/dist/
RUN sed -i 's/3000/3306/g' /the-example-app.nodejs/bin/www
RUN addgroup asif \
    && adduser -h /home/asif -S -G asif asif -s /bin/bash
RUN chown asif:asif /the-example-app.nodejs 
#RUN chmod 666 -R /the-example-app.nodejs
#RUN chmod 666 -R /usr/local/lib/node_modules/
USER asif
EXPOSE 3306
VOLUME /the-example-app.nodejs
CMD ["npm", "run", "start:dev"]
