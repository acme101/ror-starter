FROM ruby:2.4.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /hello-world

# add more arguments from CI to the image so that `$ env` should reveal more info
ARG CI_BUILD_ID
ARG CI_BUILD_REF
ARG CI_REGISTRY_IMAGE
ARG CI_BUILD_TIME
ARG RAILS_ENV

ENV CI_BUILD_ID=$CI_BUILD_ID CI_BUILD_REF=$CI_BUILD_REF CI_REGISTRY_IMAGE=$CI_REGISTRY_IMAGE \
    CI_BUILD_TIME=$CI_BUILD_TIME RAILS_ENV=$RAILS_ENV

WORKDIR /hello-world
ADD Gemfile /hello-world/Gemfile
ADD Gemfile.lock /hello-world/Gemfile.lock
RUN bundle install
ADD . /hello-world
CMD ["bundle exec rails s -p 3000 -b '0.0.0.0'"]