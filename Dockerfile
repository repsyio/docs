FROM klakegg/hugo:0.72.0-onbuild AS hugo

RUN ls -al /target

FROM nginx
COPY --from=hugo /target /usr/share/nginx/html

RUN ls -al /usr/share/nginx/html