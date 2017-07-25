#!/bin/bash

apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

bundle install

bundle exec rails s -p $PORT -b '0.0.0.0'
