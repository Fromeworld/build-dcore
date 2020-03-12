# Use an official Python runtime as a base image
FROM fromeworld/dev_ubuntu1804_for_triqs

# Become a mere user
RUN adduser testuser
USER testuser
ENV HOME=/home/testuser
WORKDIR $HOME
