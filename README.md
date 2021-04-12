Based on: [docker-compose-laravel](https://github.com/aschmelyun/docker-compose-laravel)

## Setup

- Clone the repo
- Run `docker-compose up -d`
- Remove file `.gitkeep` from `src` directory (aero will not install if the directory is not empty)
- Run `docker-compose run --rm composer global require aerocommerce/cli && pwd && aero new --no-install`
- Aero cli responses
  - project directory type `src`
  - enter username/password credentials when asked
  - site name: Whatever the site is called
  - "Next up the database details..." ctrl/cmd + c to exit out of the installer. The database will not connect.
- Run `docker-compose run artisan aero:configure`
  - host: `mysql`
  - port: `3306`
  - db name: `aero`
  - db username: `aero`
  - db password: `aero`
  - elasticsearch host: `elasticsearch:9200`
- Run `docker-compose run artisan aero:install`

You should now be able to visit localhost and see the default site. If you cannot see the site/get an nginx error restart with `docker-compose restart`

## Populate the catalog:

- Run `docker-compose run artisan aero:import:products:csv https://aero-data.s3.eu-west-2.amazonaws.com/products.csv`
- Elastic search may need rebuilding `docker-compose run artisan aero:search:rebuild`

## Login to the admin area:

- http://localhost/admin
- username: `admin@example.com`
- password: `aerocommerce`
