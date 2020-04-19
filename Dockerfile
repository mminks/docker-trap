FROM debian:10-slim

ADD trap.sh /

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        unzip \
        curl \
        jq \
    && curl -L https://github.com/barnybug/cli53/releases/download/0.8.17/cli53-linux-amd64 \
        -o /usr/local/bin/cli53 \
    && chmod +x /usr/local/bin/cli53 \
    && curl https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o /tmp/awscliv2.zip \
    && unzip -d /tmp /tmp/awscliv2.zip \
    && /tmp/aws/install \
    && rm -Rf /tmp/aws* \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

ENTRYPOINT ["bash", "/trap.sh"]
