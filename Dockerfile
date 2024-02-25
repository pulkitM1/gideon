# docker build -t ubuntu1604py36
FROM ubuntu:18.04

RUN apt-get update  --fix-missing
RUN apt-get install -y software-properties-common vim wget git
RUN apt-get install python3.8 -y
RUN apt-get update
RUN apt-get install openssl
RUN apt-get install curl -y

RUN apt-get install -y build-essential python3.8 python3.8-dev python3-pip python3.8-venv

# update pip
RUN python3.8 -m pip install pip --upgrade
RUN python3.8 -m pip install --upgrade setuptools
RUN python3.8 -m pip install wheel

# sdk
RUN pip install docutils
RUN python3.8 -m pip install couchbase==4.1.10
RUN python3.8 -m pip install pyyaml
RUN python3.8 -m pip install requests eventlet gevent

RUN mkdir gideon
COPY . gideon/
WORKDIR gideon
ENTRYPOINT ["python3.8","gideon.py"]


