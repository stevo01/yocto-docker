# yocto - docker

This project provides a docker container for build of linux distributions
based on yocto

## suppoprted yocto versions
 * kirkstone 4.0


## checkout relevant sources

```
git clone t.b.d.
```

### build docker image and start docker container
```
docker compose build
docker compose up -d
```

### build and restart docker container
```
docker compose down && docker compose up -d --build
```

### join to docker container
```
docker compose exec -u $USER -w $PWD build-oe bash
```

# bookmarks
* https://docs.yoctoproject.org/4.0.15/brief-yoctoprojectqs/index.html
