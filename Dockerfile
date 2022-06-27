FROM python:3.10-buster

RUN apt-get update && apt-get install -y \
    python3-pandas \
    python3-scipy \
    python3-sklearn \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

COPY pyproject.toml .
COPY poetry.lock .

RUN pip install -U pip \
    && pip install poetry \
    && poetry config virtualenvs.create false \
    && poetry install 

CMD mlflow server \
    --host 0.0.0.0 \
    --port 5000 \
    --backend-store-uri ${BACKEND_STORE_URI:-./mlruns} \
    --serve-artifacts \
    --artifacts-destination ${ARTIFACTS_DESTINATION:-./mlartifacts}

EXPOSE 5000
