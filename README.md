# The Littlest JupyterHub

> forked from [jupyterhub/the-littlest-jupyterhub](https://github.com/jupyterhub/the-littlest-jupyterhub)

## Documentation

Our latest documentation is at: https://the-littlest-jupyterhub.readthedocs.io

We place a high importance on consistency, readability and completeness of
documentation. If a feature is not documented, it does not exist. If a behavior
is not documented, it is a bug! We try to treat our documentation like we treat
our code: we aim to improve it as often as possible.

If something is confusing to you in the documentation, it is a bug. We would be
happy if you could [file an issue](https://github.com/jupyterhub/the-littlest-jupyterhub/issues) about it - or
even better, [contribute a documentation fix](http://the-littlest-jupyterhub.readthedocs.io/en/latest/contributing/docs.html)!

## How to use;

### 1. Create directory project

```shell
mkdir my-tljh
cd my-tljh
```

### 2. Create config file: `config.yaml`

```yaml
base_url: /tljh # http://localhost/tljh
limits:
  memory: 4G
  cpu: 2
user_environment:
  default_app: jupyterlab # set defualt page [classic,jupyterlab,nteract](default: classic (notebook))
services:
  cull: # Culling idle notebook servers (https://tljh.jupyter.org/en/latest/topic/idle-culler.html?highlight=cull#culling-idle-notebook-servers)
    enabled: false # not  shutdown user server
```

### 3. Create compose file `docker-compose.yaml`

```yaml
version: "3"
services:
  tljh:
    image: attap0n/tljh-systemd:latest
    privileged: true
    restart: always
    ports:
      - 12000:80
    environment: TZ=Asia/Bangkok # set TimeZone (default: Asia/Bangkok)
    volumes:
      - ./config.yaml:/opt/tljh/config/config.yaml:rw # map config file
```

### 4. Run container with `docker-compose`

```shell
docker-compose up -d
```

### 5. Create AdminAccount (username: `admin` password: `admin`)

```shell
docker-compose exec -it tljh bootstrap --admin admin:admin
```

> same `sudo python3 /srv/src/bootstrap/bootstrap.py --show-progress-page --admin admin:admin`

### 6. Use [http://localhost:12000/tljh](http://localhost:12000/tljh)
