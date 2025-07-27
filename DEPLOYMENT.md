# Deployment Guide

This guide explains how to deploy the SenWiseTool API documentation.

## 🚀 Vercel Deployment

### Prerequisites

1. **Vercel Account**: Sign up at [vercel.com](https://vercel.com)
2. **Vercel CLI**: Install with `npm i -g vercel`
3. **GitHub Repository**: Ensure your code is pushed to GitHub

### Setup Steps

#### 1. Connect to Vercel

```bash
# Login to Vercel
vercel login

# Link your project
vercel link
```

#### 2. Deploy

```bash
# Deploy to preview
vercel

# Deploy to production
vercel --prod
```

### GitHub Actions Integration

The CI/CD pipeline automatically deploys to Vercel when you push to the `main` branch. You'll need to add these secrets to your GitHub repository:

1. Go to your GitHub repository → Settings → Secrets and variables → Actions
2. Add the following secrets:
   - `VERCEL_TOKEN`: Your Vercel API token
   - `VERCEL_ORG_ID`: Your Vercel organization ID
   - `VERCEL_PROJECT_ID`: Your Vercel project ID

#### How to get these values:

```bash
# Get Vercel token
vercel whoami

# Get project info
vercel ls
```

## 🐳 Docker Development

### Local Docker

```bash
# Build and run documentation server
docker build -t senwisetool-api-docs .
docker run -p 8080:8080 -v $(pwd):/app senwisetool-api-docs

# Or run in detached mode
docker run -d -p 8080:8080 -v $(pwd):/app --name api-docs senwisetool-api-docs
```

### Why Docker for API Specs?

- **Consistent Environment**: Same setup across all machines
- **Easy Setup**: No need to install Node.js or dependencies locally
- **Isolation**: Clean environment for development
- **Portability**: Works the same way everywhere

## 📚 GitHub Pages

### Manual Deployment

```bash
# Build documentation
npm run docs:build

# Deploy to GitHub Pages
npm run deploy:gh-pages
```

### Automatic Deployment

The CI/CD pipeline automatically deploys to GitHub Pages when you push to the `main` branch.

## 🔧 Development Workflow

### Local Development

```bash
# Traditional way
npm run docs:serve

# Docker way
docker build -t senwisetool-api-docs .
docker run -p 8080:8080 -v $(pwd):/app senwisetool-api-docs
```

### Documentation Updates

```bash
# Make changes to OpenAPI spec
# Build documentation
npm run docs:build

# Deploy
git push origin main  # Automatic deployment via CI/CD
```

## 📊 Monitoring

### Health Checks

- **Vercel**: Automatic health monitoring
- **Docker**: Health check configured in Dockerfile
- **GitHub Pages**: Automatic monitoring

### Logs

```bash
# Vercel logs
vercel logs

# Docker logs
docker logs api-docs
```

## 🔒 Security

### SSL/TLS

- **Vercel**: Automatic SSL certificates
- **GitHub Pages**: Automatic SSL certificates

### Headers

Security headers are configured in `vercel.json` for Vercel deployment.

## 🚨 Troubleshooting

### Common Issues

1. **Build Failures**
   ```bash
   # Check build logs
   npm run build
   
   # Validate OpenAPI spec
   npm run validate
   ```

2. **Docker Issues**
   ```bash
   # Check Docker logs
   docker logs api-docs
   
   # Rebuild image
   docker build --no-cache -t senwisetool-api-docs .
   ```

3. **Vercel Issues**
   ```bash
   # Check deployment status
   vercel ls
   
   # View logs
   vercel logs
   ```

### Support

For deployment issues:
1. Check the [Vercel documentation](https://vercel.com/docs)
2. Review [Docker documentation](https://docs.docker.com)
3. Open an issue in this repository 