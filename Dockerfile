FROM python:3.10.12-alpine3.18

WORKDIR /app/

COPY requirements.txt .

RUN python3 -m pip install -r requirements.txt

RUN python3 -m pip install gunicorn==20.1.0

COPY . .

RUN python3 manage.py collectstatic

CMD [ "gunicorn", "kata.wsgi", "--bind=0.0.0.0:8000" ]
