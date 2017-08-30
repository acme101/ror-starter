#!/bin/bash

#bundle install

# bundle exec rails s -p $PORT -b '0.0.0.0'

bundle exec rdebug-ide --host 0.0.0.0 --port 1234 --dispatcher-port 26162 -- /opt/app/bin/rails s -b 0.0.0.0 -p $PORT -e $RAILS_ENV