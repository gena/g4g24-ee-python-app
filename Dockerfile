# Use the official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.10

# Allow statements and log messages to immediately appear in the logs
ENV PYTHONUNBUFFERED True

# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . ./

# Install production dependencies.
RUN pip install --no-cache-dir -r requirements.txt

# Run the voila web service on container startup. 
CMD exec voila --port=$PORT --Voila.ip=0.0.0.0 --no-browser /app/notebooks/ee-viola-app.ipynb

# Run gunicorn service on container startup. 
# CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app

