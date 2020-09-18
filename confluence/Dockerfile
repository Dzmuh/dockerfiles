ARG BASE_IMAGE=atlassian/confluence-server:7.7.3-ubuntu
FROM $BASE_IMAGE
LABEL maintainer "Ilya Fralkou <ilya-fralkou@outlook.com>" version="7.7.3-ubuntu"

# install dependencies for PlantUML plugin
RUN apt-get update -y && \
    apt-get install -y graphviz && \
    apt-get install -y texlive-latex-extra dvipng && \
    apt-get clean
