# Ubuntu Build Image

Ubuntu base image for multi-staged image building.

## Ubuntu License

See https://ubuntu.com/legal/intellectual-property-policy

## Dockerfile License

It's just free. (Public Domain)

See https://github.com/yidigun/ubuntu-build

## Supported tags

* ```20.04```, ```focal-20220531```, ```focal``` (not supported)
* ```21.10```, ```impish-20220531```, ```impish``` (not supported)
* ```22.04```, ```jammy-20220531```, ```jammy```, ```latest```, ```rolling```
* ```22.10```, ```kinetic-20220602```, ```kinetic```, ```devel```

## Changelog

* 2022-02-18 - Change default locale to en_US.UTF-8, timezone to UTC

## Use Image

This image is a base image with dpkg build tools.

```shell
docker run --rm -it yidigun/ubuntu-build:20.04
```

```dockerfile
FROM docker.io/yidigun/ubuntu-build:20.04 AS build
RUN ...

FROM docker.io/yidigun/ubuntu-base:20.04 AS product
COPY --from=build /tmp/some.deb /tmp
RUN dpkg -i /tmp/some.deb
```
