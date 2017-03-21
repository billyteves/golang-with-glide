FROM billyteves/alpine:3.5.0

MAINTAINER Billy Ray Teves <billyteves@gmail.com>

ENV GOPATH	/go
ENV PATH 	$GOPATH/bin:/usr/local/go/bin:$PATH

ADD ./run-ssh /usr/local/bin/run-ssh

RUN apk update --no-cache \
    && apk upgrade --no-cache \
    && apk add --no-cache --virtual --update \

    # Install important apks 

    git \
    make \
    bzr \
    build-base \
    musl-dev \
    musl-utils \
    go \
    glide \

    # Make directories

    && mkdir -p $GOPATH/bin \
    && mkdir -p $GOPATH/src \

    # CHMOD

    && chmod -R 777 $GOPATH \

    # Cleanup

    && rm -rf /var/cache/apk/* \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* \
    && chmod +x /usr/local/bin/run-ssh

WORKDIR /go/src/app

