FROM ruby:2.4.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /hello-world
WORKDIR /hello-world
ADD Gemfile /hello-world/Gemfile
ADD Gemfile.lock /hello-world/Gemfile.lock
RUN bundle install
ADD . /hello-world