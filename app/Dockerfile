FROM ruby:2.7.3-alpine3.13

ENV ROOT="/app"
ENV LANG=C.UTF-8

WORKDIR ${ROOT}

RUN apk update && \
    apk upgrade && \
    apk add --no-cache \
        bash \
        curl \
        gcc \
        g++ \
        libc-dev \
        libxml2-dev \
        linux-headers \
        make \
        nodejs \
        sqlite-dev \
        tzdata \
        g++ \
        git && \
    apk add --virtual build-packs --no-cache \
        build-base \
        curl-dev

RUN touch ~/.bashrc \
      && curl -o- -L https://yarnpkg.com/install.sh | bash \
      && ln -s "$HOME/.yarn/bin/yarn" /usr/local/bin/yarn

COPY Gemfile ${ROOT}
COPY Gemfile.lock ${ROOT}

RUN bundle install
RUN yarn install

RUN apk del build-packs

COPY . ${ROOT}