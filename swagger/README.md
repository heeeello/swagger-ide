# Swagger Editor for ScaleIT with integrated backend

Swagger Editor lets you edit [Swagger API specifications](https://github.com/swagger-api/swagger-spec/blob/master/versions/2.0.md) in YAML inside your browser and to preview documentations in real time.
Valid Swagger JSON descriptions can then be generated and used with the full Swagger tooling (code generation, documentation, etc).

#### Running with Docker

The swagger-editor for ScaleIT is published in a [public repository on Dockerhub](https://hub.docker.com/r/20029119312185181/swagger-scaleit/)

You can run editor easily with docker:

```bash
docker pull 20029119312185181/swagger-scaleit
docker run -p 80:8080 20029119312185181/swagger-scaleit
```

#### Documentations
* [Importing your Swagger document](./docs/import.md)
* [Development Guide](./docs/development.md)
* [Configuration Guide](./docs/config.md)
* [Cross Origin Request Sharing(CORS) issues](docs/cors.md)

[Contributing](./.github/CONTRIBUTING.md)

[LICENSE](./LICENSE)
