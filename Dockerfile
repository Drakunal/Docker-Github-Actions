FROM python:3.10-slim

# Set up a working directory
WORKDIR /code

# Copy just the requirements into the working directory so it gets cached by itself
COPY ./requirements.txt /code/requirements.txt

# Install the dependencies from the requirements file
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Copy the code into the working directory
COPY ./app /code/app

# Add the startup script for both services
RUN chmod +x /code/app/start.sh
# Expose ports for MLflow (7777) and FastAPI (80)
EXPOSE 7777 80



# Start MLflow model serving and FastAPI
CMD ["/bin/bash", "/code/app/start.sh"]