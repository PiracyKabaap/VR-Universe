FROM python:3.10-slim

# Fix DNS + force IPv4 + update repos
RUN apt-get update -o Acquire::ForceIPv4=true && \
    apt-get install -y --no-install-recommends git ca-certificates && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /requirements.txt

RUN pip install --no-cache-dir -U pip && \
    pip install --no-cache-dir -r /requirements.txt

WORKDIR /VJ-FILTER-BOT
COPY . .

CMD ["python", "bot.py"]
