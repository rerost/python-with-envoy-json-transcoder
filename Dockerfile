## ----- Envoy
FROM envoyproxy/envoy:v1.10.0 as envoy
COPY ./envoy/ /config

## ----- Server
FROM python:3.7 as server

ENV APP_ROOT /go/src/github.com/rerost/python-with-grpc-gateway
RUN ln -s $APP_ROOT/ /app

WORKDIR /app

RUN pip install pipenv

# install depe
COPY Pipfile .
COPY Pipfile.lock .
RUN pipenv install

COPY . .
