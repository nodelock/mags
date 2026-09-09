FROM node:alpine3.22

WORKDIR /app

COPY package.json /app/package.json
COPY index.js /app/index.js
COPY index.html /app/index.html
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN apk add --no-cache \
      openssl \
      curl \
      gcompat \
      iproute2 \
      coreutils \
      bash \
    && chmod +x /usr/local/bin/docker-entrypoint.sh /app/index.js \
    && cd /app \
    && npm install \
    && test -f /app/index.js \
    && test -f /app/index.html

EXPOSE 3000

CMD ["node", "/app/index.js"]
