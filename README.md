# Ubuntu Build Image

## Ubuntu License

See https://ubuntu.com/legal/intellectual-property-policy

## Dockerfile License

It's just free. (Public Domain)

See https://github.com/yidigun/ubuntu-build

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
