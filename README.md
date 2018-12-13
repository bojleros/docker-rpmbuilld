# docker-rpmbuilld
Image for building rpm packages

## How it works and how to use it

```
docker run --rm --name test -u root --tmpfs /build:rw,exec,size=2g -e GIT_REPO="https://gitlab/your/rpmbuild-repo.git" -e GIT_HTTPS_VERIFY=false bojleros/rpmbuild:x86_64-centos7-1
```

By default entrypoint will launch build.sh located in GIT_REPO
