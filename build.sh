#!/bin/sh
# Build containers for the demo

docker build -f docker/Dockerfile-cs -t spacedsl-cs .
docker build -f docker/Dockerfile-ts -t spacedsl-ts .
docker-compose -f docker/compose.yaml build