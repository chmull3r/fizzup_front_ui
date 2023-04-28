FROM node:18.16

ENV NODE_ENV=development

RUN mkdir /app
WORKDIR /app

COPY ./docker/nuxt/entrypoint.sh /
COPY ./nuxt/ /app/

RUN yarn install --prefer-offline --frozen-lockfile --non-interactive --production=false && \
    chmod +x /entrypoint.sh

ENV HOST 0.0.0.0

ENTRYPOINT ["/entrypoint.sh"]

CMD ["background"]