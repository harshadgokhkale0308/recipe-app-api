FROM python:3.6-alpine
MAINTAINER harshad gokhale 
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D django1
RUN adduser django1 sudo
RUN chown django1 /app

RUN chmod -R a+rwx /app
USER django1
