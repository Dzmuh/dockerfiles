#!/usr/bin/env bash
docker build --pull --rm -f "./Dockerfile" -t dzmuh/quiterss:latest "$(pwd)"
