# g4g24-ee-python-app


[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://shell.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/gena/g4g24-ee-python-app.git)


1. Open Terminal

2. Create python virtual env and install dependencies

```bash
cd g4g24-ee-python-app
pip install virtualenv
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt 
```

3. Open notebooks/ee-viola-app.ipynb and modify PROJECT

3. Start Viola

This will start a new server in the Cloud Shell which can be used for testing during development

```bash
voila --Voila.tornado_settings="{'allow_origin': '*'}" ./notebooks/ee-viola-app.ipynb
```

4. Deploy App to Cloud Run

Check the Dockerfile file to see how we configure the app.

Modify deploy.sh and run in the terminal:

./deploy.sh


Is this step goes wrong - test docker image locally by calling:

```bash
docker pull us-central1-docker.pkg.dev/dgena-demo2/g4g24-repository/ee-python-app:latest
docker images # check image name
docker run -it <IMAGE_NAME> /bin/bash
docker image rm <IMAGE_NAME>
```