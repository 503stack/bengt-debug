FROM docker.io/library/alpine@sha256:3f4d6b32e26703c6082839234f43769d5046b3ac7c910033911d1e71d8cd630a
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
