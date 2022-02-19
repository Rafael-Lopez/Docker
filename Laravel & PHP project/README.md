# Laravel & PHP Dockerized project
Demo of a multicontainer setup for PHP, Laravel and MySQL.

## Build Laravel project
Use the ```composer``` utility container to generate a Laravel project:
```bash
docker-compose run --rm composer create-project --prefer-dist laravel/laravel .
```

## Run Laravel app

### Option 1
Run app specifying all needed services in ```docker-compose``` command:
```bash
docker-compose up -d server php mysql
```

### Option 2
Run app by only specifying 'server' in ```docker-compose``` command:
```bash
docker-compose up -d server
```
This is possible because we added ```depends_on``` to the ```server``` service, which tells ```docker-compose``` that,
in order to bring up ```server```, it nedds the ```php``` and ```mysql``` services.

### Option 3
Run app by only specifying 'server' in ```docker-compose``` command and re-building images if there are any changes:
```bash
docker-compose up -d --build server
```
You can use this option when you know you change something in one of your images (Dockerfiles).

## Run Artisan migrations
Make sure the server is running, and then run:
```bash
docker-compose run --rm artisan migrate
```