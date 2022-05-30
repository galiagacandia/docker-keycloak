# docker-keycloak
Keycloak sobre docker


Para construir la imagen inicial de keycloak:

```bash
docker build . -t galiaga/keycloak:0.0.1
```

Para deployar los contenedores:

```bash
docker-compose up
```