FROM python:3.10.5-bullseye

RUN pip3 install -U pip \
    && pip3 install \
    boto3==1.24.17 \
    mlflow==1.26.1 \
    mysqlclient==2.1.1 \
    pymysql==1.0.2 \
    && rm -rf ~/.cache/pip

WORKDIR /mlflow

ENV BACKEND_STORE_URI=./mlruns
ENV ARTIFACTS_DESTINATION=./mlartifacts

CMD mlflow server \
    --host 0.0.0.0 \
    --port 5000 \
    --backend-store-uri ${BACKEND_STORE_URI} \
    --serve-artifacts \
    --artifacts-destination ${ARTIFACTS_DESTINATION}

EXPOSE 5000
