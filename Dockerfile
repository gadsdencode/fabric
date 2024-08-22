FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV POETRY_HOME="/root/.local"
ENV PATH="$POETRY_HOME/bin:$PATH"

# Set the working directory
WORKDIR /fabric

# Install system dependencies and Poetry
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && curl -sSL https://install.python-poetry.org | python3 - \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the dependency files
COPY pyproject.toml poetry.lock /fabric/

# Install Python dependencies
RUN poetry install --no-root --only main

# Copy the rest of the application code
COPY . /fabric

# Specify the default command to run
CMD ["poetry", "run", "python", "installer/server/api/fabric_api_server.py"]
