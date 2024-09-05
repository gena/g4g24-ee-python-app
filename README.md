# g4g24-ee-python-app


[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://shell.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/gena/g4g24-ee-python-app.git)

## Develop EE Python dashboard app

Open `notebooks/notebooks/ee-voila-app.ipynb` for an example showing to develop EE-enabled dashboard using Python and ipywidgets.

Make sure to replace the `YOUR_PROJECT_NAME` with your Cloud Project name where Earth Engine is registered. If this not the case - follow the https://code.earthengine.google.com/register and register your project first. 

## Run Voila locally during development

For local development, it is best to run voila in a separate virtual environment. Create a Python virtual environment and install dependencies in the following way:

```bash
cd ./cloudshell_open/g4g24-ee-python-app
pip3 install virtualenv
virtualenv venv
source venv/bin/activate
pip3 install -r requirements.txt 
```

The following command will start a new voila server in the Cloud Shell which can be used for testing during development:

```bash
voila --Voila.tornado_settings="{'allow_origin': '*'}" ./notebooks/ee-voila-app.ipynb
```

Notice that we disable CORS to make sure that the app URL redirected by the Cloud Shell can be accessed.

After you run the above command in the Cloud Shell Terminal, it will print the URL of the server started on the Cloud Shell machine `http://localhost:8866/` and will automatically redirect all traffict to the viola server, follow that link:

<img width="755" alt="image" src="https://github.com/user-attachments/assets/3b194ea4-f903-4ccc-ba05-38cc67701bf3">

If everything works fine, you should page like this:

<img width="947" alt="image" src="https://github.com/user-attachments/assets/7e5b3bf8-8f47-4198-8fa2-137c8e752e78">

## Deploy to Cloud run

Edit `deploy.sh` and replace the `YOUR_PROJECT_NAME` in the second line of the script, then run `./deploy.sh` to deploy your app to Cloud Run.

## Troubleshouting 

If image build fails, test docker image locally by calling:

```bash
docker pull us-central1-docker.pkg.dev/dgena-demo2/g4g24-repository/ee-python-app:latest
docker images # check image name
docker run -it <IMAGE_NAME> /bin/bash
docker image rm <IMAGE_NAME>
```

