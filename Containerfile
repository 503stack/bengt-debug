FROM docker.io/library/alpine@sha256:294b683cb724975bec92580e1e685676bd4b50bda910ddb8c51d4cabeaec77e6
LABEL org.opencontainers.image.authors="Bengt <bengt@fredhs.net>"

RUN apk update && apk upgrade -a && \
    apk add bash bind-tools ca-certificates curl iputils jq mtr \
    openssh-client openssl postgresql-client socat tcpdump \
    tcptraceroute traceroute util-linux-misc && \
    rm -rf /tmp/* /var/cache/apk/*

RUN printf '%s\n' \
    "alias cp='cp -i'" \
    "alias egrep='grep -E --color=auto'" \
    "alias fgrep='grep -F --color=auto'" \
    "alias grep='grep --color=auto'" \
    "alias l.='ls -d .* --color=auto'" \
    "alias ll='ls -l --color=auto'" \
    "alias ls='ls --color=auto'" \
    "alias mv='mv -i'" \
    "alias rm='rm -i'" \
    > /root/.bashrc

WORKDIR /root

ENTRYPOINT ["tail", "-f", "/dev/null"]
