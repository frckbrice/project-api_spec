# CocoaFlow API Specification

<img src="https://images.unsplash.com/photo-1667900598245-6620cea1c04c?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Y29jb2F8ZW58MHx8MHx8fDA%3D" alt="CocoaFlow - Cocoa Industry Management" width="100%" style="max-height: 300px; object-fit: cover;">

![display image](docs/api_spec_image_1.png)

[![OpenAPI 3.1.0](https://img.shields.io/badge/OpenAPI-3.1.0-green.svg)](https://spec.openapis.org/oas/v3.1.0)
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Node.js](https://img.shields.io/badge/Node.js-18+-green.svg)](https://nodejs.org/)
[![Redocly](https://img.shields.io/badge/Redocly-Latest-orange.svg)](https://redocly.com/)

> Comprehensive OpenAPI 3.1.0 specification for CocoaFlow - A modern cocoa industry management platform

## 🌟 Overview

CocoaFlow is a comprehensive **API specification** designed for managing cocoa industry operations, including farmer management, farm tracking, certification compliance, and supply chain optimization. This specification serves as the contract between frontend and backend teams, ensuring consistent development and integration.

> **Note**: This is an API specification project. The actual API implementation is in development. You can use this specification to understand the API design and generate client libraries.

### 🎯 Key Features

- **Farmer Management**: Complete farmer profiles, contracts, and relationship tracking
- **Farm Operations**: GPS coordinates, inspection data, and compliance monitoring
- **Certification Support**: Rainforest Alliance compliance tracking and audit trails
- **Supply Chain**: Market management, transactions, and inventory tracking
- **Training & Education**: Session management and participant tracking
- **Analytics & Reporting**: Comprehensive data insights and business intelligence

### 🏗️ Architecture Highlights

- **OpenAPI 3.1.0** specification with modern features
- **JWT Bearer Token** authentication with OAuth 2.0 support
- **RESTful API** design with consistent patterns
- **Comprehensive error handling** with standardized responses
- **Rate limiting** and security best practices

## 🚀 Quick Start

### Prerequisites

- Node.js 18+
- npm 8+

### Installation

```bash
# Clone the repository
git clone git@github.com:frckbrice/project-api_spec.git
cd project-api_spec

# Install dependencies
npm install

# Start development server
npm run docs:serve
```

### Available Scripts

```bash
# Development
npm run docs:serve       # Serve documentation on port 8080
npm run docs:build       # Build static documentation

# Quality Assurance
npm run lint            # Lint OpenAPI specification
npm run validate        # Validate specification

# Build & Generate
npm run bundle          # Bundle specification into single file
npm run generate:client # Generate TypeScript client
```

## 📚 Documentation

### API Reference

| Environment                  | URL                                                                                          | Status       |
| ---------------------------- | -------------------------------------------------------------------------------------------- | ------------ |
| Documentation (Vercel)       | [https://project-apispec.vercel.app](https://project-apispec.vercel.app)                     | ✅ Live      |
| Documentation (GitHub Pages) | [https://frckbrice.github.io/project-api_spec](https://frckbrice.github.io/project-api_spec) | ✅ Live      |
| Local Development            | `http://localhost:8080`                                                                      | ✅ Available |

### Project Structure

```
project-api_spec/
├── swt_api_spec/
│   ├── components/
│   │   ├── schemas/          # Data models and schemas
│   │   ├── responses/        # Reusable response definitions
│   │   └── parameters/       # Common parameter definitions
│   ├── paths/               # API endpoint definitions
│   │   ├── farm/            # Farm management endpoints
│   │   ├── user/            # User management endpoints
│   │   ├── company/         # Company management endpoints
│   │   └── ...              # Other domain endpoints
│   └── cocoaflow-api.yaml   # Main OpenAPI specification
├── docs/                    # Documentation assets
├── dist/                    # Bundled specifications
├── sdks/                    # SDK design specifications
│   ├── javascript/          # JS/TS SDK design
│   └── python/             # Python SDK design
├── postman/                # Postman collection
├── redocly.yaml           # Redocly configuration
└── package.json           # Project dependencies and scripts
```

## 🔧 Development

### Adding New Endpoints

1. Create endpoint file in appropriate directory under `paths/`
2. Define schema in `components/schemas/` if needed
3. Add path reference to main `cocoaflow-api.yaml`
4. Run `npm run lint` to validate
5. Update documentation with examples

### Example: Adding Farm Inspection Endpoint

```yaml
# paths/farm/farm_{id}_inspection.yaml
get:
  tags:
    - Farms
  summary: Get farm inspection data
  description: Retrieve inspection data for a specific farm
  operationId: getFarmInspection
  parameters:
    - name: id
      in: path
      required: true
      schema:
        type: string
        format: cuid
  responses:
    "200":
      description: Farm inspection data retrieved successfully
      content:
        application/json:
          schema:
            $ref: "../../components/schemas/inspection_data.yaml"
```

## 🔒 Security

### Authentication Methods

1. **JWT Bearer Token** (Primary)
   - 24-hour expiration
   - Refresh token support
   - Role-based access control

2. **API Key** (Service-to-Service)
   - Webhook authentication
   - Automated integrations
   - Rate limiting per key

### Security Features

- HTTPS enforcement
- Rate limiting
- Input validation
- SQL injection prevention
- XSS protection
- CORS configuration

## 🤝 Contributing

1. Fork the repository
2. Create feature branch (`git checkout -b feature/amazing-feature`)
3. Make changes and run tests (`npm run test`)
4. Commit changes (`git commit -m 'Add amazing feature'`)
5. Push to branch (`git push origin feature/amazing-feature`)
6. Open Pull Request

## 👨‍💻 Developer

### Portfolio & Links

- **Portfolio**: [https://maebrieporfolio.vercel.app/](https://maebrieporfolio.vercel.app/)
- **GitHub**: [https://github.com/frckbrice](https://github.com/frckbrice)
- **LinkedIn**: [https://linkedin.com/in/avombrice](https://linkedin.com/in/avombrice)

## 📞 Documentation & Support

- **API Documentation**: [https://project-apispec.vercel.app](https://project-apispec.vercel.app)
- **GitHub Repository**: [https://github.com/frckbrice/project-api_spec](https://github.com/frckbrice/project-api_spec)
- **OpenAPI Specification**: [https://project-apispec.vercel.app/cocoaflow-api.yaml](https://project-apispec.vercel.app/cocoaflow-api.yaml)
- **GitHub Issues**: [https://github.com/frckbrice/project-api_spec/issues](https://github.com/frckbrice/project-api_spec/issues)
- **Developer Contact**: [bricefrkc@gmail.com](mailto:bricefrkc@gmail.com)

## 📄 License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

---

**Built with OpenAPI 3.1.0 and Redocly**
