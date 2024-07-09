# Using the Python base image for FastAPI
FROM python:3.9-slim AS build

# Install the dependencies required for compilation
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    libssl-dev \
    libffi-dev \
    python3-dev

# Define the working directory in the container
WORKDIR /app

# Copie de requirements.txt dans le répertoire de travail
COPY requirements.txt .

# Installing Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Define the working directory in the container
COPY . .

# Command to start the FastAPI API
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
