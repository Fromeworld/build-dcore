FROM ubuntu:18.04
# set time zone to prevent type see http://p.cweiske.de/582
ENV TERM=xterm\
TZ=Europe/Berlin\
DEBIAN_FRONTEND=noninteractive

# Set the working directory to /root
WORKDIR /root

# Copy the current directory contents into the container at /app
ADD pkglst /root

# Install required packages as specified in pkglst
RUN apt-get update
RUN apt-get --assume-yes upgrade
RUN apt-get --assume-yes install $(cat pkglst)
RUN pip install jupyter

# from triqs docker
ARG NB_USER=triqs
ARG NB_UID=1000
RUN useradd -u $NB_UID -m $NB_USER && \
    echo 'triqs ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER $NB_USER
WORKDIR /home/$NB_USER
