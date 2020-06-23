#!/usr/bin/env bash
script_pwd=$(cd $(dirname "$0"); pwd)
cd $script_pwd
docker build --pull --rm -f "./Dockerfile" -t local/firefox:latest "$(pwd)"
