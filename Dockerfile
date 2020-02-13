FROM bash:latest

ADD trap.sh /

ENTRYPOINT ["bash", "/trap.sh"]
