# Dockerfile for CocoaFlow API Specification
FROM node:22-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci

# Copy source code
COPY . .

# Build documentation
RUN npm run docs:build && npm run bundle

# Expose port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8080 || exit 1

# Start documentation server using bundled specification
CMD ["npx", "redocly", "preview-docs", "./dist/cocoaflow-api.yaml", "--port", "8080", "--host", "0.0.0.0"] 