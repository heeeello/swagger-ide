FROM nimmis/apache-php5

RUN curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
RUN apt-get install -y nodejs

RUN npm install -g bower grunt-cli && \
echo '{ "allow_root": true }' > /root/.bowerrc

# Enable http_proxy, because grunt will listen to port 8000, I want to proxy it to 80 port of apache2 
RUN a2enmod headers proxy_http

ADD conf/000-default.conf /etc/apache2/sites-enabled/000-default-conf
ADD conf/apache2.conf /etc/apache2/apache2.conf

ADD index.html /var/www/html/index.html
ADD swagger /var/www/html/swagger
ADD swagger-ui /var/www/html/swagger-ui

RUN chmod -R 777 /var/www/html/swagger/backend

ADD swagger-mock-api/Gruntfile.js /var/www/html/swagger-mock-api/Gruntfile.js
ADD swagger-mock-api/package.json /var/www/html/swagger-mock-api/package.json

WORKDIR /var/www/html/swagger-mock-api

RUN npm install


ENTRYPOINT service apache2 restart && grunt
