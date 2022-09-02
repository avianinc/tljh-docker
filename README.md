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

## Requirement
 - docker - [https://www.docker.com/](https://www.docker.com/)
 - docker-compose  - [https://github.com/docker/compose](https://github.com/docker/compose)

## Quick Start
```shell
git clone https://github.com/attapon-th/tljh-docker

cd tljh-docker

./start-tljh.sh

# set admin user
# ./start-tljh.sh <username>:<password>
```
> wait setup  ~ `2-10 min`  
> can show progress page url: [http://localhost:12000/](http://localhost:12000/)


### Open URL: [http://localhost:12000/tljh](http://localhost:12000/tljh)
> Default admin user: `admin`, pass: `admin`
> 

### Add Admin
example: `admin_user2:admin_user2`
```shell
./start-tljh.sh admin_user2:admin_user2
```

---

## Configuration

Reference: [https://tljh.jupyter.org/en/latest/topic/tljh-config.html](https://tljh.jupyter.org/en/latest/topic/tljh-config.html)

### filename: `config.yaml`

```yaml
base_url: /tljh # http://localhost/tljh
limits:
  memory: 4G
  cpu: 2
user_environment:
  default_app: jupyterlab # set default startup app
services:
  cull: 
    enabled: false # not  shutdown user server
```

### Compose file `docker-compose.yaml`

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