FROM python:3.10-slim

WORKDIR /app

COPY pyproject.toml poetry.lock /app/
RUN pip install poetry && poetry install

COPY . /fabric

CMD ["poetry", "run", "python", "installer/server/api/fabric_api_server.py"]