FROM alpine

RUN apk --update add --no-cache curl git openssh && \
    rm -rf /var/lib/apt/lists/*

RUN curl -L -o /usr/local/bin/cc-test-reporter https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64
RUN chmod +x /usr/local/bin/cc-test-reporter

# Since we're running the ENTRYPOINT in exec mode, we don't have access to shell variables. cc-test-reporter needs PATH.
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin 
ENTRYPOINT ["/usr/local/bin/cc-test-reporter"]
