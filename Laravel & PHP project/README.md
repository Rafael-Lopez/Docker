# Laravel & PHP Dockerized project
Demo of a multicontainer setup for PHP, Laravel and MySQL.

## Build Laravel project
Use the ```composer``` utility container to generate a Laravel project:
```bash
docker-compose run --rm composer create-project --prefer-dist laravel/laravel .
```
