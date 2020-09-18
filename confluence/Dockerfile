ARG BASE_IMAGE=atlassian/confluence-server:7.5.2-ubuntu
FROM $BASE_IMAGE
LABEL maintainer "Ilya Fralkou <ilya-fralkou@outlook.com>" version="7.5.2-ubuntu"

# install dependencies for PlantUML plugin
RUN apt-get update -y && \
    apt-get install -y graphviz && \
    apt-get clean
