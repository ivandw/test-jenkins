FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install python python-pip -y
RUN mkdir /opt/app
COPY src/main.py /opt/app/
COPY requirements.txt /opt/app/
RUN pip install -r /opt/app/requirements.txt
EXPOSE 5000
COPY Dockerentrypoint.sh  /
ENTRYPOINT "/Dockerentrypoint.sh"
