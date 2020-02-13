FROM bash:latest

ADD trap.sh /

RUN set -exo pipefail \
    && apk add --no-cache \
        curl \
        jq

ENTRYPOINT ["bash", "/trap.sh"]
