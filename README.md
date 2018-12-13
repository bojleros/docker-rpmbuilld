# docker-rpmbuilld
Image for building rpm packages

## How it works and how to use it

```
docker run --rm --name build -u root --tmpfs /build:rw,exec,size=2g -e GIT_REPO="" GIT_TAG="" GIT_HTTPS_VERIFY="" bojleros/rpmbuild:x86_64-centos7-1
```
