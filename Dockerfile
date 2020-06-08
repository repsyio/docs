FROM klakegg/hugo:0.72.0-onbuild AS hugo

FROM nginx
COPY --from=hugo /target /usr/share/nginx/html