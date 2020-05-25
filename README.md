# match-api-spec


## Public Endpoint

http://api-spec.gameye.com/latest/openapi.yaml

This endpoint redirects automatically to an URL with the version included. 
For example: http://api-spec.gameye.com/v0.0.7/openapi.json

## Spin up local docs server
```sh
npx redoc-cli serve src/openapi.yaml --watch
```
