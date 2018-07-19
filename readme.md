# Docker Kong (with custom plugins)

First put your custom plugins `in custom-plugins` dir. 


##### Create database container 
```sh
$ docker run -d --name kong-database  -p 5432:5432  -e "POSTGRES_USER=kong" -e "POSTGRES_DB=kong" postgres:9.5
```

##### Build Kong custom image
```sh
$ docker build -t kong-custom .
```

##### Run database migration
```sh
$ docker run --rm \
  --link kong-database:kong-database \
  -e "KONG_DATABASE=postgres" \
  -e "KONG_PG_DATABASE=kong" \
  -e "KONG_PG_USER=kong" \
  -e "KONG_CUSTOM_PLUGINS=your-plugin" \
  -e "KONG_PG_HOST=172.17.0.2" \
  kong-custom kong migrations up
```

##### Run Kong server
```sh
$ docker run -d --name kong-custom \
  -e "KONG_DATABASE=postgres" \
  -e "KONG_PG_HOST=kong-database" \
  -e "KONG_PG_DATABASE=kong" \
  -e "KONG_PG_USER=kong" \
  -e "KONG_LOG_LEVEL=info" \
  -e "KONG_CUSTOM_PLUGINS=your-plugin" \
  -e "KONG_ADMIN_LISTEN=0.0.0.0:8001" \
  -e "KONG_ADMIN_LISTEN_SSL=0.0.0.0:8444" \
  -p 8000:8000 \
  -p 8443:8443 \
  -p 8001:8001 \
  -p 8444:8444 \
  kong-custom
```
