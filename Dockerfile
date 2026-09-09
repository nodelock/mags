FROM node:alpine3.22

WORKDIR /tmp

COPY package.json /tmp/package.json
COPY index.js /tmp/index.js
COPY index.html /tmp/index.html

RUN apk add --no-cache \
      openssl \
      curl \
      gcompat \
      iproute2 \
      coreutils \
      bash \
    && chmod +x /tmp/index.js \
    && npm install \
    && test -f /tmp/index.js \
    && test -f /tmp/index.html \
    && test -f /tmp/package.json \
    && ls -la /tmp

EXPOSE 3000

CMD ["node", "index.js"]
