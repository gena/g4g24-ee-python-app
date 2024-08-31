#!/bin/bash

export PROJECT="dgena-demo2"
export REGION="us-central1"
export REPOSITORY="g4g24-dgena-repository"
export IMAGE="ee-python-app"
export IMAGE_PATH=${REGION}-docker.pkg.dev/${PROJECT}/${REPOSITORY}/${IMAGE}

gcloud config set project $PROJECT
gcloud services enable artifactregistry.googleapis.com
gcloud services enable cloudbuild.googleapis.com
gcloud services enable run.googleapis.com

gcloud artifacts repositories create $REPOSITORY --project=$PROJECT --repository-format=docker --location=$REGION --description="Docker repository for G4G demos"

gcloud builds submit  --project=$PROJECT --region=$REGION --tag=${IMAGE_PATH}

gcloud run deploy --project=$PROJECT --region $REGION --allow-unauthenticated --image ${IMAGE_PATH} ${IMAGE}
