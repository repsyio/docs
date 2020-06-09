FROM appropriate/curl AS curl

RUN ls -al && cd themes && ls -al && \
    curl https://github.com/matcornic/hugo-theme-learn/archive/2.5.0.tar.gz && \
    ls -al && tar xvzf 2.5.0.tar.gz && ls -al

FROM klakegg/hugo:0.72.0-onbuild AS hugo

RUN ls -al /target

FROM nginx
COPY --from=hugo /target /usr/share/nginx/html

RUN ls -al /usr/share/nginx/html