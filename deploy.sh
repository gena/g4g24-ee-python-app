#!/bin/bash
export PROJECT="<YOUR_PROJECT_NAME>" # <<< change this to your Cloud Project name

if [ $PROJECT = "<YOUR_PROJECT_NAME>" ]; then
    echo "Error: please change <YOUR_PROJECT_NAME> to your project name in deploy.sh"
    exit 1
fi

export REGION="us-central1"
export REPOSITORY="${PROJECT}-repository"
export IMAGE="${PROJECT}-ee-python-app"
export IMAGE_PATH=${REGION}-docker.pkg.dev/${PROJECT}/${REPOSITORY}/${IMAGE}

gcloud config set project $PROJECT

gcloud services enable artifactregistry.googleapis.com
gcloud services enable cloudbuild.googleapis.com
gcloud services enable run.googleapis.com

gcloud artifacts repositories create $REPOSITORY --project=$PROJECT --repository-format=docker --location=$REGION --description="Docker repository for G4G demos"

gcloud builds submit  --project=$PROJECT --region=$REGION --tag=${IMAGE_PATH}

gcloud run deploy --project=$PROJECT --region=$REGION --allow-unauthenticated --image=${IMAGE_PATH} ${IMAGE}
