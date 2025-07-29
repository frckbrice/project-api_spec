# Vercel Deployment Setup Guide

This guide will help you set up Vercel deployment for the CocoaFlow API specification.

## Current Issue

The error `Project not found` indicates that either:

1. The Vercel project doesn't exist yet
2. The project ID or organization ID is incorrect
3. The Vercel token doesn't have access to the project

## Solution Steps

### Option 1: Create a New Vercel Project (Recommended)

1. **Install Vercel CLI**:

   ```bash
   npm install -g vercel
   ```

2. **Login to Vercel**:

   ```bash
   vercel login
   ```

3. **Deploy the project**:

   ```bash
   cd project-api_spec
   vercel --prod
   ```

4. **Get the project details**:
   After deployment, Vercel will show you:
   - Project ID
   - Organization ID
   - Deployment URL

5. **Update GitHub Secrets**:
   Go to your GitHub repository → Settings → Secrets and variables → Actions
   Update these secrets:
   - `VERCEL_TOKEN`: Your Vercel token (get from https://vercel.com/account/tokens)
   - `VERCEL_ORG_ID`: The organization ID from step 4
   - `VERCEL_PROJECT_ID`: The project ID from step 4

### Option 2: Link to Existing Project

If you already have a Vercel project:

1. **Link to existing project**:

   ```bash
   cd project-api_spec
   vercel link
   ```

2. **Follow the prompts** to select your existing project

3. **Get project details**:

   ```bash
   vercel project ls
   ```

4. **Update GitHub secrets** with the correct values

### Option 3: Manual Project Creation

1. **Go to Vercel Dashboard**: https://vercel.com/dashboard

2. **Create New Project**:
   - Click "New Project"
   - Import your GitHub repository
   - Configure the project settings

3. **Get Project Details**:
   - Go to Project Settings
   - Copy the Project ID and Organization ID

4. **Update GitHub Secrets**

## GitHub Secrets Configuration

### Required Secrets

| Secret Name         | Description      | How to Get                        |
| ------------------- | ---------------- | --------------------------------- |
| `VERCEL_TOKEN`      | Vercel API token | https://vercel.com/account/tokens |
| `VERCEL_ORG_ID`     | Organization ID  | From Vercel dashboard or CLI      |
| `VERCEL_PROJECT_ID` | Project ID       | From Vercel dashboard or CLI      |

### Setting Up Secrets

1. Go to your GitHub repository
2. Click **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. Add each secret with the correct name and value

## Alternative: GitHub Pages Only

If you prefer to use only GitHub Pages (which is already working):

1. **Remove Vercel deployment** from the CI workflow
2. **Keep only GitHub Pages deployment**

The API documentation will still be available at:
`https://[your-username].github.io/[repo-name]/`

## Testing the Configuration

After updating the secrets:

1. **Push a change** to trigger the CI workflow
2. **Check the workflow logs** for Vercel deployment status
3. **Verify the deployment** at your Vercel URL

## Troubleshooting

### Common Issues

1. **"Project not found"**:
   - Verify project ID and org ID are correct
   - Ensure the Vercel token has access to the project

2. **"Token invalid"**:
   - Generate a new token at https://vercel.com/account/tokens
   - Update the `VERCEL_TOKEN` secret

3. **"Permission denied"**:
   - Ensure your Vercel account has access to the organization
   - Check if the project is in the correct organization

### Debugging Commands

```bash
# Check Vercel CLI status
vercel whoami

# List projects
vercel project ls

# Get project details
vercel project inspect [project-id]

# Test deployment locally
vercel --debug
```

## Current Status

The CI workflow has been updated to:

- ✅ Continue on Vercel deployment errors
- ✅ Still deploy to GitHub Pages even if Vercel fails
- ✅ Provide clear status messages
- ✅ Not block the entire pipeline

This ensures your API documentation is always deployed to GitHub Pages, even if Vercel deployment has issues.
