FROM golang:latest

RUN apt install git -y
RUN go get github.com/go-bindata/go-bindata/...
RUN git clone https://github.com/elsaland/elsa.git
WORKDIR ./elsa
RUN make build
RUN mv elsa /usr/local/bin/
COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]
CMD ["elsa"]