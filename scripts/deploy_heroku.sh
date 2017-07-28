#!/bin/bash


cat > ~/.netrc << EOF
machine api.heroku.com
  login $HEROKU_EMAIL
  password $HEROKU_API_KEY
machine git.heroku.com
  login $HEROKU_EMAIL
  password $HEROKU_API_KEY
EOF

chmod 600 ~/.netrc # Heroku cli complains about permissions without this

heroku whoami

echo "finding $HEROKU_APP_NAME...";

FOUND_APP=`heroku apps | grep $HEROKU_APP_NAME`;


if [ -z "$FOUND_APP" -a "$FOUND_APP" != " " ]; then
  echo "$HEROKU_APP_NAME app not found, creating...";
  heroku apps:create $HEROKU_APP_NAME --no-remote
else
  echo "$HEROKU_APP_NAME app found, updating...";
fi

heroku config:set SECRET_KEY_BASE=$SECRET_KEY_BASE -a $HEROKU_APP_NAME &> /dev/null # hide secret output

docker tag $DOCKER_IMAGE $HEROKU_IMAGE
docker push $HEROKU_IMAGE
