# Ubuntu Build Image

Ubuntu base image for multi-staged image building.

## Ubuntu License

See https://ubuntu.com/legal/intellectual-property-policy

## Dockerfile License

It's just free. (Public Domain)

See https://github.com/yidigun/ubuntu-build

## Supported OS/Arch

* ```linux/amd64```
* ```linux/arm64```

## Supported tags

* ```20.04```, ```focal-20240530```, ```focal```
* ```22.04```, ```jammy-20240808```, ```jammy``` (amd64 only)
* ```24.04```, ```noble-20240801```, ```noble```, ```latest```, ```rolling```
* ```24.10```, ```oracular-20240811.1```, ```oracular```, ```devel```

## Changelog

* 2024-08-25 - Add 24.04 LTS support
* 2022-02-18 - Change default locale to en_US.UTF-8, timezone to UTC

## Use Image

This image is a base image with dpkg build tools.

```shell
docker run --rm -it yidigun/ubuntu-build:24.04
```

```dockerfile
FROM docker.io/yidigun/ubuntu-build:24.04 AS build
RUN ...

FROM docker.io/yidigun/ubuntu-base:24.04 AS product
COPY --from=build /tmp/some.deb /tmp
RUN dpkg -i /tmp/some.deb
```
