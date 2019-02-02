#####################################
# Maintained by: Mareks Pikalovs
#####################################

FROM python:2.7-slim

RUN addgroup flask \
    && adduser -s /bin/sh -D -G flask flask

RUN mkdir -p /microservice

ADD requirements.txt /microservice
RUN pip install -r /microservice/requirements.txt

RUN pip install ansible

ADD . /webapp

RUN chown -R flask:flask /microservice

USER flask
WORKDIR /microservice

EXPOSE 5000

ENTRYPOINT ["python"]

CMD ["run.py"]