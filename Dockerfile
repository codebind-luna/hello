FROM golang:1.16-alpine AS build
WORKDIR /hello
COPY go.* ./
RUN go mod download
COPY main.go .
RUN CGO_ENABLED=0 go build -o /out/hello .

FROM ubuntu AS bin
COPY --from=build /out/hello /
EXPOSE 8081
# ARG user=appuser
# ARG group=appuser
# ARG uid=1000
# ARG gid=1000

# Run process with user ${user}, uid = 1000
# Remarks: If you mount a volume from the host or a data container, ensure to use the same uid

# RUN groupadd -g ${gid} ${group} && useradd -u ${uid} -g ${group} -s /bin/sh ${user}

#Run Container as nonroot
# USER ${user}
CMD ["/hello"]