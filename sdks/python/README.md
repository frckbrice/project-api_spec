# SenWiseTool Python SDK

Official Python SDK for the SenWiseTool API - Cocoa Industry Management Platform.

## Installation

```bash
pip install senwisetool-sdk
```

## Quick Start

```python
from senwisetool import SenWiseToolAPI

# Initialize the client
client = SenWiseToolAPI(
    api_key='your-api-key',
    base_url='https://api.senwisetool.com'
)

# Authenticate
auth_response = client.auth.login(
    email='user@example.com',
    password='password'
)

# Create a farm
farm = client.farms.create({
    'location': {
        'lat': 6.5244,
        'lng': 3.3792
    },
    'farmer_id': 'clh1234567890abcdef',
    'village': 'Ibadan Village',
    'division': 'Oyo Division',
    'council': 'Ibadan Council'
})

# List farms with pagination
farms = client.farms.list(
    limit=20,
    offset=0,
    company_id='clh1234567890abcdef'
)

# Get specific farm
farm_details = client.farms.get(farm_id='clh1234567890abcdef')
```

## Features

- **Async Support**: Full async/await support
- **Type Hints**: Complete type annotations
- **Authentication**: JWT Bearer token handling
- **Rate Limiting**: Automatic request throttling
- **Error Handling**: Custom exception classes
- **Pagination**: Iterator-based pagination
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

## Examples

```python
# Async usage
import asyncio
from senwisetool import AsyncSenWiseToolAPI

async def main():
    client = AsyncSenWiseToolAPI(api_key='your-api-key')
    
    # Create multiple farms
    farms = []
    for i in range(5):
        farm = await client.farms.create({
            'location': {'lat': 6.5244 + i*0.001, 'lng': 3.3792 + i*0.001},
            'farmer_id': f'farmer_{i}',
            'village': f'Village {i}',
            'division': 'Oyo Division',
            'council': 'Ibadan Council'
        })
        farms.append(farm)
    
    return farms

# Run async function
farms = asyncio.run(main())
```

## Documentation

- [API Reference](https://project-apispec.vercel.app)
- [Authentication Guide](https://project-apispec.vercel.app/#tag/Authentication)
- [Examples](https://github.com/frckbrice/project-api_spec/tree/main/sdks/python/examples)

## License

Apache 2.0 