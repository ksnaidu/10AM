FROM python:3.9.24-alpine3.22 AS builder

WORKDIR /build

# install build dependencies
RUN apk add --no-cache python3-dev build-base linux-headers pcre-dev

COPY requirements.txt .

RUN pip3 install --no-cache-dir --prefix=/install -r requirements.txt

FROM python:3.9.24-alpine3.22

EXPOSE 8080

WORKDIR /opt/server

RUN apk add --no-cache pcre

RUN addgroup -S roboshop && adduser -S roboshop -G roboshop

USER roboshop

COPY --from=builder /install /usr/local

COPY --chown=roboshop:roboshop payment.ini .

COPY --chown=roboshop:roboshop *.py .

CMD ["uwsgi", "--ini", "payment.ini"]




# FROM python:3.9
# EXPOSE 8080
# WORKDIR /opt/servre
# COPY requirements.txt .
# COPY *.py .
# COPY payment.ini .
# RUN pip3 install -r requirements.txt
# CMD ["uwsgi", "--ini", "payment.ini"]
