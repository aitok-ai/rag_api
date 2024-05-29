# Release to Production in Singapore

## LibreChat

- generate `JWT_SECRET` by running `openssl rand -hex 32` and save it in SSM Parameter Store as `/libreChat/Prod/RAG_JWT_SECRET`

### Update ECS Task Definition

- update ECS task definition with the following 2 variables and 1 secret

```
RAG_API_URL="http://rag-api.production:8000"
RAG_USE_FULL_CONTEXT=true
```

and `JWT_SECRET valueFrom /libreChat/Prod/RAG_JWT_SECRET`

- No need to add `uploads` to EFS since it is only temporary. Files are deleted once they are stored in the database with embeddings.

### Update ECS Service

- to use latest task definition
- use Service Connect: client side only, use the `production` namespace

## RAG-API
