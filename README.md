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

## Learn more

- https://github.com/teracyhq/dev
- http://rubyonrails.org/
=======
