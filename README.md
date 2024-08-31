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
voila --Voila.tornado_settings="{'allow_origin': '*'}" ./notebooks/ee-viola-app.ipynb
```
