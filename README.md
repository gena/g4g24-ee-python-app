# g4g24-ee-python-app


[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://shell.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/gena/g4g24-ee-python-app.git)

## Develop EE Python dashboard app

Check `notebooks/ee-viola-app.ipynb` and update PROJECT variable.

## Run Voila locally during development

The following command will start a new voila server in the Cloud Shell which can be used for testing during development:

```bash
voila --Voila.tornado_settings="{'allow_origin': '*'}" ./notebooks/ee-viola-app.ipynb
```

Notice, that we disable CORS to make sure that the app url redirected by Cloud Shell can be accessed.

For local developmennt, the best is to run voila in a separate virtual environment. Create python virtual env and install dependencies in the following way:

```bash
cd ./cloudshell_open/g4g24-ee-python-app
pip install virtualenv
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt 
```

## Deploy to Cloud run

Edit deploy.sh and update the PROJECT variable, then run ./deploy.sh to deploy your app to Cloud Run.

## Troubleshouting 

If image build fails - test docker image locally by calling:

```bash
docker pull us-central1-docker.pkg.dev/dgena-demo2/g4g24-repository/ee-python-app:latest
docker images # check image name
docker run -it <IMAGE_NAME> /bin/bash
docker image rm <IMAGE_NAME>
```
