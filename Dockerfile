# Use an official Python runtime as a parent image
FROM python:3.9-slim as base

# Set the working directory
WORKDIR /usr/src/app

# Install any needed packages specified in requirements.txt
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . .

# Clean up unnecessary files and cache
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Run leader.py when the container launches
CMD ["python", "./leader.py"]
