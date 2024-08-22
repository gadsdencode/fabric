FROM python:3.10-slim

# Set environment variables to prevent Python from writing .pyc files
# and to ensure logs are not buffered
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set work directory
WORKDIR /fabric

# Install system dependencies and Poetry
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && curl -sSL https://install.python-poetry.org | python3 - \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY pyproject.toml poetry.lock /fabric/
RUN poetry install --no-root --no-dev

# Copy the rest of the application code
COPY . /fabric

# Specify the default command to run
CMD ["poetry", "run", "python", "installer/server/api/fabric_api_server.py"]
