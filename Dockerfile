FROM python:3.11-slim

RUN apt-get update && apt-get install -y build-essential curl && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD ["python", "bot.py"]
