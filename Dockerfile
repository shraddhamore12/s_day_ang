FROM httpd


# copy my website to web root
COPY  dist/myapp/ /usr/local/apache2/htdocs/


EXPOSE 80

CMD apachectl -D FOREGROUND 
