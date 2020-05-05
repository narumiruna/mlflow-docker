FROM python:3

RUN pip3 install -U pip \
    && pip3 install mlflow \
    && rm -rf ~/.cache/pip

CMD mlflow server --host 0.0.0.0

EXPOSE 5000
