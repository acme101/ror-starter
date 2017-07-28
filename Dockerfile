FROM ruby:2.4.1

LABEL authors="duc4nh <duc4nh.nguyen@gmail.com>"

RUN mkdir -p /opt/app

ENV TERM=xterm APP=/opt/app

# add more arguments from CI to the image so that `$ env` should reveal more info
ARG CI_BUILD_ID
ARG CI_BUILD_REF
ARG CI_REGISTRY_IMAGE
ARG CI_BUILD_TIME
ARG RAILS_ENV

ENV CI_BUILD_ID=$CI_BUILD_ID CI_BUILD_REF=$CI_BUILD_REF CI_REGISTRY_IMAGE=$CI_REGISTRY_IMAGE \
    CI_BUILD_TIME=$CI_BUILD_TIME RAILS_ENV=$RAILS_ENV

WORKDIR $APP

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ADD Gemfile Gemfile.lock $APP/

RUN bundle install

ADD . $APP

CMD ["sh", "run-prod.sh"]
