FROM alpine:3.23

ARG KUBECTL_PREINSTALLED=false
ARG DOCKER_CLI_PREINSTALLED=false
ARG GIT_PREINSTALLED=false
ARG NODEJS_PREINSTALLED=false

RUN set -eux; \
    apk add --no-cache bash ca-certificates curl; \
    if [ "${KUBECTL_PREINSTALLED}" = "true" ]; then \
        apk add --no-cache kubectl; \
    fi; \
    if [ "${DOCKER_CLI_PREINSTALLED}" = "true" ]; then \
        apk add --no-cache docker-cli docker-cli-buildx; \
    fi; \
    if [ "${GIT_PREINSTALLED}" = "true" ]; then \
        apk add --no-cache git; \
    fi; \
    if [ "${NODEJS_PREINSTALLED}" = "true" ]; then \
        apk add --no-cache nodejs npm; \
    fi; \
    rm -rf /var/cache/apk/*

