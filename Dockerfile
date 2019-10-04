FROM debian:stretch


RUN apt-get update \
    && apt-get install openssl -y \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/lib/apt/lists/partial/*


ARG APP_HOME=/home/community


COPY _build/prod/rel/community $APP_HOME


WORKDIR $APP_HOME


ENV LANG=C.UTF-8
ENV PATH="$APP_HOME/bin:$PATH"


EXPOSE 4000


ENTRYPOINT [ "community", "start" ]
