FROM golang:1.19.5

COPY bin/* /usr/local/bin/

ENTRYPOINT [ "/usr/local/bin/server-linux" ]
