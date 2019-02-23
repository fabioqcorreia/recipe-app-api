FROM python:3.7-alpine

#python unbuffered environmental variable
ENV PYTHONUNBUFFERED 1

#copy requirements.txt from the directory adjacent to
#the Dockerfile into dockerimage/requirments.txt
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt 

#create an empty folder named app in docker image
RUN mkdir /app 
WORKDIR /app
COPY ./app /app

RUN adduser -D user
USER user
