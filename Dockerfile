# Base Image
FROM python:3.10.8-slim-buster

# Install dependencies
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy requirements
COPY requirements.txt /requirements.txt

# Install python packages
RUN pip3 install --no-cache-dir -U pip && \
    pip3 install --no-cache-dir -r /requirements.txt

# Create working directory
WORKDIR /VJ-FILTER-BOT

# Copy project files
COPY . .

# Run bot
CMD ["python", "bot.py"]
