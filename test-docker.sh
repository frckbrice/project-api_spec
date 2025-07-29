#!/bin/bash

echo "Building Docker image..."
docker build -t cocoaflow-api-docs .

echo "Running container..."
docker run -d --name test-container -p 8080:8080 cocoaflow-api-docs

echo "Waiting for container to start..."
sleep 10

echo "Container logs:"
docker logs test-container

echo "Container status:"
docker ps -a

echo "Testing endpoint..."
curl -v http://localhost:8080

echo "Cleaning up..."
docker stop test-container
docker rm test-container

echo "Test completed!" 