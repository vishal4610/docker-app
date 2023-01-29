# FROM docker.io/library/debian:11
FROM debian:11

# Set environment variables
ENV PYTHON_VERSION 3.9
ENV DEBIAN_FRONTEND noninteractive

# Install system packages
RUN apt-get update && \
    apt-get install -y \
    git \
    python3.9 \
    python3-pip \
    nano \
    wget \
    vim \
    curl \
    net-tools
    

# Set python alias
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.9 1

# Clone the GitHub repository
RUN git clone https://github.com/vishal4610/docker-app.git /app
WORKDIR /app

# Install python dependencies
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

# Make the artifact file available outside the container
VOLUME /app/file_with_lines.txt

# Run the application
CMD ["python", "main.py", "--lines_number", "10"]