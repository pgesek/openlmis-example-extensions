FROM gliderlabs/alpine:3.4

COPY build/extensions/*.jar /etc/extensions/
CMD cp /etc/extensions/* /extensions/
