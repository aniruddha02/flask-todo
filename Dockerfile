FROM python:3.10.5-alpine3.15

MAINTAINER aniruddha.mitra@stryker.com
ENV PYTHONUNBUFFERED 1

WORKDIR /app

RUN apk add ca-certificates
RUN apk update \
  # psycopg2 dependencies
  && apk add --virtual build-deps gcc g++ python3-dev musl-dev \
  && apk add make


ADD ./requirements.txt /app/requirements.txt
RUN pip install -r requirements.txt

ADD . /app

EXPOSE 5000

RUN chmod +x /app/entrypoint

ENTRYPOINT ["/app/entrypoint"]