#!/bin/bash

# First check if /var/www/html/swagger/backend/specs have swagger.yaml. If have, then do nothing. 
# If not, copy swagger.example.yaml to specs/swagger.yaml 

SWAGGER_FILE=/var/www/html/swagger/backend/specs/swagger.yaml
SWAGGER_EXAMPLE_FILE=/var/www/html/swagger/backend/swagger.example.yaml


if [[ ! -f $SWAGGER_FILE ]]; then
  cp -fv $SWAGGER_EXAMPLE_FILE $SWAGGER_FILE
  chown -R www-data:www-data /var/www/html/swagger/backend/specs/
fi

service apache2 restart && grunt
