FROM node:14-alpine3.16 as builder

RUN apk update && apk add --no-cache git && \
    git clone --depth 1 https://github.com/rawgraphs/rawgraphs-app.git

WORKDIR /rawgraphs-app

RUN yarn install && yarn build 
# RUN npm install -g bower && \ 
#     bower install --allow-root && \
#     cp js/analytics.sample.js js/analytics.js

# FROM alpine:3.16.3
# COPY --from=builder /rawgraphs-app/ /rawgraphs-app/
# RUN apk update && apk add --no-cache python3 && \
#     ln -s /usr/bin/python3 /usr/bin/python
# WORKDIR /rawgraphs-app
# EXPOSE 4000
# CMD ["python","-m","http.server","4000"] 

#  yarn global add serve
#   serve -s build

# RUN yarn install --production && yarn build

## Single stage for now...
# FROM node:14-alpine3.16


# WORKDIR /rawgraphs-app

# COPY --from=builder --chown=node /rawgraphs-app/node_modules ./node_modules
# # Copying the production-ready application code, so it's one of few required artifacts
# COPY --from=builder --chown=node /rawgraphs-app/dist ./dist
# COPY --from=builder --chown=node /rawgraphs-app/public ./public
# COPY --from=builder --chown=node /rawgraphs-app/package.json .


#### To TEST -- nginx deploy
# FROM nginx:1.12-alpine
# COPY --from=build-deps  /rawgraphs-app/build /usr/share/nginx/html
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]

EXPOSE 3000

CMD [ "yarn", "start" ]