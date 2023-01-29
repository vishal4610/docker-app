FROM debian:11

# Update package list and upgrade installed packages
RUN apt-get update && apt-get upgrade -y

# Install necessary packages
RUN apt-get install -y python3.9 python3.9-dev python3.9-venv
RUN apt-get install -y git nano

# Create a virtual environment and activate it
RUN python3.9 -m venv /venv
ENV PATH="/venv/bin:$PATH"

# Clone the application from GitHub
RUN git clone https://github.com/vishal4610/docker-app.git

# Install dependencies
RUN pip install --upgrade pip
RUN pip install -r /docker-app/requirements.txt

# Add alias for python3.9
RUN echo "alias python='python3.9'" >> ~/.bashrc

# Copy the artifact to a directory outside the container
RUN cp /docker-app/artifact.txt /artifact

# Set the working directory
WORKDIR /docker-app

# Entry point to run the application
CMD ["python", "file_generator.py", "--lines_number", "10"]