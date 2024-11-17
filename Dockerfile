FROM python:3.13

WORKDIR /code

RUN pip install pipenv

COPY ./Pipfile /code/Pipfile
COPY ./Pipfile.lock /code/Pipfile.lock

RUN pipenv install

ENV PORT=8000

COPY ./app /code/app

CMD ["pipenv", "run", "fastapi", "run", "app/main.py", "--port", "${PORT}"]