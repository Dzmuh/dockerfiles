#!/usr/bin/env bash
docker build --pull --rm -f "./Dockerfile" -t local/gollum:latest "$(pwd)"