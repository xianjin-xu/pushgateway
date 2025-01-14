ARG ARCH="amd64"
ARG OS="linux"
FROM quay.io/prometheus/busybox-${OS}-${ARCH}:latest
#FROM quay.azk8s.cn/prometheus/busybox-${OS}-${ARCH}:latest
#FROM quay-mirror.qiniu.com/prometheus/busybox-${OS}-${ARCH}:latest
LABEL maintainer="The Prometheus Authors <prometheus-developers@googlegroups.com>"

ARG ARCH="amd64"
ARG OS="linux"
#COPY --chown=nobody:nobody .build/${OS}-${ARCH}/pushgateway /bin/pushgateway
COPY --chown=nobody:nobody pushgateway /bin/pushgateway

EXPOSE 9091
RUN mkdir -p /pushgateway && chown nobody:nobody /pushgateway
WORKDIR /pushgateway

USER 65534

ENTRYPOINT [ "/bin/pushgateway" ]
