FROM alpine:3.22
LABEL maintainer="Michael BD7MQB <bd7mqb@qq.com>"

ARG TARGETPLATFORM
RUN apk update
RUN apk --no-cache add curl

ADD /etc /app
ADD /entrypoint.sh /app/entrypoint.sh
ADD /bin/$TARGETPLATFORM/mosdns /app/mosdns
RUN chmod +x /app/update 

ENV TZ=Asia/Shanghai \
    CRON="0 0 * * *"
    
WORKDIR /app
EXPOSE 53/tcp 53/udp

ENTRYPOINT ["/app/entrypoint.sh"]
CMD ["/app/mosdns", "start", "-d", "/app"]