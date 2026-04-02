FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y ca-certificates && \
    update-ca-certificates && \
    rm -rf /var/lib/apt/lists/*

COPY requirements.txt /requirements.txt

RUN pip install --no-cache-dir -U pip && \
    pip install --no-cache-dir -r /requirements.txt

WORKDIR /app
COPY . .

CMD ["python", "bot.py"]
