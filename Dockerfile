FROM node:14-alpine3.16 as builder

RUN apk update && apk add --no-cache git && \
    git clone --depth 1 https://github.com/rawgraphs/rawgraphs-app.git

WORKDIR /rawgraphs-app

RUN yarn install && yarn build 

## THX: https://codefresh.io/docs/docs/example-catalog/ci-examples/react/ 

FROM nginx:1.12-alpine
COPY --from=builder  /rawgraphs-app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]