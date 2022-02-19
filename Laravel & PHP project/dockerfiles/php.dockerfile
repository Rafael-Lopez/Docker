FROM php:8.0-fpm-alpine
 
WORKDIR /var/www/html
 
COPY src .
 
RUN docker-php-ext-install pdo pdo_mysql
 
RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

COPY --chown=laravel:laravel src .

USER laravel 

# We don't need a CMD here. Remember, if you don't have a command or entry point at the end, then 
# the command or entry point of the base image will be used if it has any.
# This PHP base image will have a default command which is executed, which in the end is a command that invokes
# the PHP interpreter. So this image which we're building here will then automatically run this default command
# of the base image. Therefore, it will be able to deal with incoming PHP files that should be interpreted
# because our base image is invoking this interpreter.