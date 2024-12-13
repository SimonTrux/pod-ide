# BASE
FROM alpine:3.20.3 AS base

RUN apk update && apk add neovim=~=0.10.0 bash git curl wget ripgrep


# BUILDER
FROM base AS builder

RUN apk add gcc musl-dev make python3 nodejs npm gzip unzip

## OLD BLOCK FROM GIT
# RUN git clone https://github.com/josean-dev/dev-environment-files.git /tmp/devfiles
# RUN mkdir -p ~/.config
# RUN cp -r /tmp/devfiles/.config/nvim ~/.config/ 

COPY config_nvim /root/.config/nvim

RUN nvim --headless "+Lazy! sync" +MasonToolsInstallSync +qa

#RUN nvim --headless "+Lazy! sync" +qa
#RUN nvim --headless +MasonToolsInstallSync +qa

#RUN touch /tmp/from_builder

ENTRYPOINT [ "/bin/bash" ]

# FINAL RUNNER
#FROM base AS runner
#
#RUN mkdir -p ~/.config
#RUN mkdir -p ~/.local/share
#
#COPY --from=builder ~/.config/nvim ~/.config/
#COPY --from=builder ~/.local/share/nvim ~/.local/share/
#
#RUN mkdir -p /workdir
#WORKDIR /workdir
#
#ENTRYPOINT [ "/bin/bash" ]
