FROM python:3.7-alpine

#python unbuffered environmental variable
ENV PYTHONUNBUFFERED 1

#copy requirements.txt from the directory adjacent to
#the Dockerfile into dockerimage/requirments.txt
COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps \
        gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps

#create an empty folder named app in docker image
RUN mkdir /app 
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user
