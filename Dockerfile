# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Install system dependencies for PyTorch and other dependencies
RUN apt-get update && apt-get install -y \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy the current directory contents into the container at /app
COPY . .

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install torch==2.3.1 torchvision==0.18.1 torchaudio==2.3.1
RUN pip install -r requirements.txt

# Expose the port Gradio will run on
EXPOSE 7860

# Run the Gradio web UI
CMD ["python", "app.py"]