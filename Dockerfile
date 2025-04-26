# Use the official Python 3.8 base image
FROM python:3.8

# Set the working directory inside the container
WORKDIR /app

# Copy all files from current directory to /app in the container
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose the port (Flask usually runs on 5000)
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
