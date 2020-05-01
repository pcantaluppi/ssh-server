FROM alpine:latest

RUN apk update \
      && apk upgrade \
      && apk add --no-cache openssh openrc \
      && mkdir -p /run/openrc/ \
      && touch /run/openrc/softlevel \
      && rc-update add sshd && rc-status

RUN adduser -D remote

RUN echo "remote:jumpohost42" | chpasswd

CMD /etc/init.d/sshd start && tail -f /dev/null