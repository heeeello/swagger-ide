#!/bin/bash

# First check if /var/www/html/swagger/backend/specs have swagger.yaml. If have, then do nothing. 
# If not, copy swagger.example.yaml to specs/swagger.yaml 

SWAGGER_FILE=/var/www/html/swagger/backend/specs/swagger.yaml
SWAGGER_EXAMPLE_FILE=/var/www/html/swagger/backend/swagger.example.yaml
PRISM_CFG_FILE=/var/www/html/prism.cfg

if [[ ! -f $SWAGGER_FILE ]]; then
  cp -fv $SWAGGER_EXAMPLE_FILE $SWAGGER_FILE
fi

if [[ ! -f $PRISM_CFG_FILE ]]; then
    echo '{"updatedAt": "0"}' > $PRISM_CFG_FILE
    chmod 777 $PRISM_CFG_FILE
fi

chmod -R 777 /var/www/html/swagger/backend/specs/

cd /var/www/html/


nohup prism run --cors -d --mock -p 8000 -s /var/www/html/swagger/backend/specs/swagger.yaml -c $PRISM_CFG_FILE > prism.log 2>&1 &

service apache2 restart  && tail -F /var/www/html/prism.log /var/log/apache2/*
