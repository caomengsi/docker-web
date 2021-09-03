FROM python:3.4

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN apt-get install libxml2-dev
RUN pip install --upgrade pip setuptools
RUN pip install Flask==0.10.1 uWSGI==2.0.15 requests==2.5.1 redis==2.10.3 
WORKDIR /app
COPY app /app
COPY cmd.sh /

EXPOSE 9090 9191
USER uwsgi
#CMD ["uwsgi", "--http", "0.0.0.0:9090", "--wsgi-file", "/app/dock.py", \
# "--callable", "app", "--stats", "0.0.0.0:9191"]
CMD ["/cmd.sh"]
