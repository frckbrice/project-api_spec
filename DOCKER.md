# Docker Container for CocoaFlow API Documentation

This project includes a Docker container that serves the API documentation using Redocly.

## Prerequisites

- Docker installed and running
- Node.js 18+ (for local development)

## Building the Container

```bash
docker build -t cocoaflow-api-docs .
```

## Running the Container

```bash
docker run -d --name cocoaflow-api-docs -p 8080:8080 cocoaflow-api-docs
```

## Testing the Container

### Using the Test Script

```bash
./test-docker.sh
```

### Manual Testing

1. Build the image:

   ```bash
   docker build -t cocoaflow-api-docs .
   ```

2. Run the container:

   ```bash
   docker run -d --name test-container -p 8080:8080 cocoaflow-api-docs
   ```

3. Wait for the container to start:

   ```bash
   sleep 20
   ```

4. Check container logs:

   ```bash
   docker logs test-container
   ```

5. Test the endpoint:

   ```bash
   curl http://localhost:8080
   ```

6. Clean up:
   ```bash
   docker stop test-container && docker rm test-container
   ```

## Troubleshooting

### Container Not Responding

If the container is not responding to requests:

1. Check if the container is running:

   ```bash
   docker ps -a
   ```

2. Check container logs:

   ```bash
   docker logs test-container
   ```

3. Verify the bundled specification exists:

   ```bash
   docker exec test-container ls -la dist/
   ```

4. Check if the port is exposed correctly:
   ```bash
   docker port test-container
   ```

### Common Issues

1. **Port already in use**: Make sure port 8080 is not being used by another service
2. **Container exits immediately**: Check the logs for startup errors
3. **Connection refused**: The application might need more time to start up

## CI/CD Integration

The Docker container is automatically tested in the CI/CD pipeline. The test includes:

- Building the Docker image
- Running the container
- Waiting for startup
- Testing the endpoint with retries
- Cleaning up resources

## Container Details

- **Base Image**: `node:18-alpine`
- **Port**: 8080
- **Health Check**: HTTP GET request to `/`
- **Command**: `npx redocly preview-docs ./dist/cocoaflow-api.yaml --port 8080 --host 0.0.0.0`
