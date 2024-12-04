FROM alpine:3.20.3


RUN apk update
RUN apk add git curl wget make gcc bash
RUN apk add python3~=3.12.7 neovim=~=0.10.0
RUN apk add nodejs npm

RUN mkdir -p /workdir

WORKDIR /workdir

SHELL [ "/bin/bash" ]
#ENTRYPOINT [ "/usr/bin/tail", "-f", "/dev/null" ]
#ENTRYPOINT [ "/bin/bash" ]

