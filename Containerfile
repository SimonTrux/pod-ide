# BASE
FROM alpine:3.20.3 AS base

RUN apk update && apk add neovim=~=0.10.0 bash git curl wget ripgrep fzf
COPY config_nvim /root/.config/nvim


# BUILDER
FROM base AS builder

RUN apk add gcc musl-dev make python3 nodejs npm gzip unzip

RUN nvim --headless "+Lazy! sync" +MasonToolsInstallSync +qa

#RUN nvim --headless "+Lazy! sync" +qa
#RUN nvim --headless +MasonToolsInstallSync +qa

#ENTRYPOINT [ "/bin/bash" ]

# FINAL RUNNER
FROM base AS runner

RUN mkdir -p /root/.local/share

COPY --from=builder /root/.local/share/nvim /root/.local/share/nvim

RUN mkdir -p /workdir
WORKDIR /workdir

#ENTRYPOINT [ "/bin/bash" ]
ENTRYPOINT [ "/usr/bin/nvim" ]
