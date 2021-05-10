FROM python:3-slim
MAINTAINER Duo Labs https://duo.com/labs

ARG SQL_DB_URI
ENV SQL_DB_URI $SQL_DB_URI

RUN apt update; apt install -y build-essential libssl-dev
RUN mkdir /app
COPY flask_demo /app/flask_demo/
COPY webauthn /app/webauthn/
RUN pip install -r /app/flask_demo/requirements.txt
RUN python /app/flask_demo/create_db.py

CMD ["python", "/app/flask_demo/app.py"]
