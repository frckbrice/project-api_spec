# SenWiseTool JavaScript/TypeScript SDK

Official JavaScript/TypeScript SDK for the SenWiseTool API - Cocoa Industry Management Platform.

## Installation

```bash
npm install @senwisetool/js-sdk
```

## Quick Start

```typescript
import { SenWiseToolAPI } from '@senwisetool/js-sdk';

// Initialize the client
const client = new SenWiseToolAPI({
  apiKey: 'your-api-key',
  baseURL: 'https://api.senwisetool.com'
});

// Authenticate
await client.auth.login({
  email: 'user@example.com',
  password: 'password'
});

// Create a farm
const farm = await client.farms.create({
  location: {
    lat: 6.5244,
    lng: 3.3792
  },
  farmer_id: 'clh1234567890abcdef',
  village: 'Ibadan Village',
  division: 'Oyo Division',
  council: 'Ibadan Council'
});

// List farms with pagination
const farms = await client.farms.list({
  limit: 20,
  offset: 0,
  company_id: 'clh1234567890abcdef'
});
```

## Features

- **TypeScript Support**: Full type definitions included
- **Authentication**: JWT Bearer token handling
- **Rate Limiting**: Automatic request throttling
- **Error Handling**: Comprehensive error types
- **Pagination**: Built-in pagination helpers
- **Webhooks**: Webhook signature verification

## API Coverage

- ✅ Companies Management
- ✅ User Management  
- ✅ Farmer Profiles
- ✅ Farm Operations
- ✅ Project Management
- ✅ Campaign Management
- ✅ Market Operations
- ✅ Transaction Processing
- ✅ Training Sessions
- ✅ Inspection Data

## Documentation

- [API Reference](https://project-apispec.vercel.app)
- [Authentication Guide](https://project-apispec.vercel.app/#tag/Authentication)
- [Examples](https://github.com/frckbrice/project-api_spec/tree/main/sdks/javascript/examples)

## License

Apache 2.0 