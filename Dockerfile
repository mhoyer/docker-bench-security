FROM alpine:3.24.4@sha256:f59abe656b692d901e184be3445e084786602108599d2a51d229c0f5a48c71bf

LABEL \
  org.label-schema.name="docker-bench-security" \
  org.label-schema.url="https://dockerbench.com" \
  org.label-schema.vcs-url="https://github.com/docker/docker-bench-security.git"

RUN apk add --no-cache iproute2 \
    docker-cli \
    dumb-init \
    jq

COPY . /usr/local/bin/

HEALTHCHECK CMD exit 0

WORKDIR /usr/local/bin

ENTRYPOINT [ "/usr/bin/dumb-init", "/bin/sh", "docker-bench-security.sh" ]
CMD [""]
