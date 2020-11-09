FROM node:10.11.0-alpine
RUN apk update && apk add --no-cache bash
RUN npm install -g newman newman-reporter-html newman-reporter-statsd newman-reporter-influxdb
WORKDIR /etc/newman
ENTRYPOINT ["newman"]
