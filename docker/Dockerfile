FROM debian:11

# update and install necessary packages
RUN apt-get update && apt-get install -y \
    python3.9 \
    python3-pip \
    vim \
    net-tools \
    telnet \
    curl \
    wget \
    apt-utils \
    apt-transport-https

# create app directory
RUN mkdir -p /app
WORKDIR /app

# copy requirements file
COPY requirements.txt .

# install python dependencies
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

# copy app source code
COPY . .

# set python alias
RUN echo "alias python='python3.9'" >> ~/.bashrc

# make the artifact available outside of the container
VOLUME /app

# entrypoint
CMD ["python", "file_generator.py", "--lines_number", "10"]