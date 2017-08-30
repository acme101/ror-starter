# Ruby on Rails Stack Starter

This is the seed project for Ruby on Rails applications with Docker workflow, CI/CD system.

- CI/CD with gitlab-ci: https://gitlab.com/acme101/ror-starter/pipelines
- CI/CI with travis-ci: https://travis-ci.org/acme101/ror-starter/builds

- Auto deployment to Heroku: https://develop-acme101-ror-starter.herokuapp.com/

## Getting started

- Follow: https://github.com/acme101/dev-setup/blob/develop/README.md

- Check out this repo into the `acme-dev/workspace` directory

- `$ vagrant reload --provision`

- `$ vagrant hostmanager`

- Open dev.ror.acme.dev (http or https) to check it out


## Dev Mode

To run dev mode on the current source code.

```
$ vagrant ssh
$ ws
$ cd ror-starter
$ docker-compose up -d app-dev && docker-compose logs -f app-dev
```

Open dev.ror.acme.dev (http + https modes) to check it out.

## Prod Mode

To run prod mode on the current source code.

```
$ docker-compose -f docker-compose.yml -f docker-compose.prod.yml build app-prod && \
  docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d app-prod
```

We usually scale at least 2 or more containers, so please scale it on local dev too to make sure scaling should work:

```
$ docker-compose -f docker-compose.yml -f docker-compose.prod.yml scale app-prod=2
```

Open ror.acme.dev (http + https modes) to check it out.


Don't forget to remove the container after checking out for cleaning up:

```
$ docker-compose -f docker-compose.yml -f docker-compose.prod.yml down app-prod -v
```

## Prod Review Mode

To review prod mode from different built Docker image.

For example, I need to review the `registry.gitlab.com/hoatle/ror-starter:features-1-something` Docker image
from @hoatle.

```
$ export APP_REVIEW_IMAGE=registry.gitlab.com/hoatle/ror-starter:features-1-something && \
docker-compose -f docker-compose.yml -f docker-compose.review.yml pull app-review && \
docker-compose -f docker-compose.yml -f docker-compose.review.yml up -d app-review
```

We usually scale at least 2 or more containers, so please scale it on local dev too to make sure scaling should work:

```
$ docker-compose -f docker-compose.yml -f docker-compose.review.yml scale app-review=2
```


Open review.ror.acme.dev (http + https modes) to check it out.


Don't forget to remove the containers after checking out for cleaning up:

```
$ docker-compose -f docker-compose.yml -f docker-compose.review.yml down app-review -v
```

## LAN Access

Sometimes, you need to access the site from a mobile devices or from different browser clients.

To do that, you need to know the VM ip address (accessible within LAN by default) from
http://dev.teracy.org/docs/basic_usage.html#ip-address

and use these urls for accessing:

- dev mode: dev.ror.\<vm_ip>.xip.io

- prod mode: ror.\<vm_ip>.xip.io

- review mode: review.ror.\<vm_ip>.xip.io

for example:

dev.ror.192.168.1.5.xip.io or ror.192.168.1.5.xip.io


## Internet Access

When you need to share your web app to the work.

```
$ docker-compose up -d ngrok-dev
```

After that, open http://ngrok-dev.ror.acme.dev to see the ngrok domain for internet access.

This is free and the domain will be randomly created.

This is applied the same for the local prod and local review modes.

```
$ docker-compose -f docker-compose.prod.yml up -d ngrok-prod
```

Then open http://ngrok-prod.ror.acme.dev

```
$ docker-compose -f docker-compose.review.yml up -d ngrok-review
```

Then open http://ngrok-review.ror.acme.dev


//TODO(duc4nh): add support for permanent domain access when this service is up.


## Remote Debugging

See the forwarded debug ports by:

```
$ docker-compose ps app-dev
```

You could see something like this:

```
        Name              Command      State                        Ports
-----------------------------------------------------------------------------------------------
rorstarter_app-dev_1   sh run-dev.sh   Up      0.0.0.0:32780->1234/tcp, 0.0.0.0:32779->3000/tcp
```

=> use 32780 as the debug port.

=> use acme.dev as the debug host.

RubyMine configuration

Go to Run -> Edit Configurations...

Add a new "Ruby remote debug". Fill in the fields with the following:

- Remote host: acme.dev
- Remote port: 32780
- Remote root folder: /opt/app
- Local port: 26162
- Local root folder: path to the folder of your project on your local machine

Click "OK" to save the new configuration.

Run remote debugging in RubyMine: Go to the "Run" menu and select the new Debug configuration that you set up.

Put a break point somewhere in your code and we can start debugging.

## Learn more

- https://github.com/teracyhq/dev
- http://rubyonrails.org/
