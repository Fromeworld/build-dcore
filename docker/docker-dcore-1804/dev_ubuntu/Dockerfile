FROM ubuntu:18.04
# set time zone to prevent type see http://p.cweiske.de/582

# Set the working directory to /root
WORKDIR /root

# Copy the current directory contents into the container at /app
ADD pkglst /root

# Install required packages as specified in pkglst
RUN apt-get update
RUN apt-get -y upgrade
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install $(cat pkglst)\
    && \
    apt-get autoremove --purge -y && \
    apt-get autoclean -y && \
    rm -rf /var/cache/apt/* /var/lib/apt/lists/*

RUN pip install --no-cache-dir notebook==5.* ipython==5.* ipykernel==4.*