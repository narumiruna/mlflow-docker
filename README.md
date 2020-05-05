# mlflow-docker

```shell
docker build -f Dockerfile -t narumi/mlflow .
docker run -d -p 5000:5000 -v $(pwd):/workspace narumi/mlflow
```

```shell
docker-compose up -d
```
