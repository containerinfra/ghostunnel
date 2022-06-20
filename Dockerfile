FROM centos:8 as build

ARG GHOSTUNNEL_VERSION=v1.6.1
ARG GHOSTUNNEL_SHA256=0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5

RUN curl -L -O https://github.com/ghostunnel/ghostunnel/releases/download/${GHOSTUNNEL_VERSION}/ghostunnel-${GHOSTUNNEL_VERSION}-linux-amd64 \
    \
    && sha256sum ghostunnel-${GHOSTUNNEL_VERSION}-linux-amd64 \
    && echo "${GHOSTUNNEL_SHA256} ghostunnel-${GHOSTUNNEL_VERSION}-linux-amd64" | sha256sum -c \
    \
    && mv ghostunnel-${GHOSTUNNEL_VERSION}-linux-amd64 /usr/local/bin/ghostunnel \
    && chmod +x /usr/local/bin/ghostunnel

# Resulting image
FROM gcr.io/distroless/base-debian11:nonroot
COPY --from=build /usr/local/bin/ghostunnel /usr/local/bin/ghostunnel
ENTRYPOINT [ "/usr/local/bin/ghostunnel" ]
