FROM python:3

RUN pip3 install -U pip \
    && pip3 install \
    boto3 \
    mlflow \
    pymysql \
    && rm -rf ~/.cache/pip

WORKDIR /mlflow

CMD mlflow server \
    --host 0.0.0.0 \
    --port 5000 \
    --default-artifact-root ${DEFAULT_ARTIFACT_ROOT} \
    --backend-store-uri ${BACKEND_STORE_URI}

EXPOSE 5000
