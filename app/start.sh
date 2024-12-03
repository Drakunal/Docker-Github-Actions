#!/bin/bash

# Set MLflow Tracking URI to the local directory
export MLFLOW_TRACKING_URI=file:/code/app/mlruns

# Start MLflow model serving
mlflow models serve -m "/code/app/models/churn_model/version-1" -p 7777 > /code/mlflow.log 2>&1 &

# Start FastAPI application
uvicorn app.main:app --host 0.0.0.0 --port 80
