FROM ubuntu:18.04 as builder

ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.8.0/s6-overlay-amd64.tar.gz /tmp/
RUN mkdir -p /overlay
RUN gunzip -c /tmp/s6-overlay-amd64.tar.gz | tar -xf - -C /overlay

FROM sampot/basebox:18.04-spk1

COPY --from=builder /overlay /

ENTRYPOINT ["/init"]

CMD ["/usr/bin/nologin"]
