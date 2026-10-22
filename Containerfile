FROM docker.io/library/alpine@sha256:c6b073f8e9e58d881f6ffba6ebf3b9ebd60b9e7d6e8337018c0e68bb5c356873
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
