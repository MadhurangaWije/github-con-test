FROM choreoipaas/choreo-ballerina:swan-lake-alpha2 AS builder

WORKDIR /tmp/
COPY ./project/ /tmp/
RUN bal build || test $(find /tmp/target/bin/ -name *.jar)

# temp change to use jdk tools for profiling
FROM adoptopenjdk/openjdk11:jre-11.0.9_11.1-alpine
RUN apk update && apk add bash
COPY --from=builder /tmp/target/bin/*.jar .
COPY docker-entrypoint.sh .
ENTRYPOINT ["/docker-entrypoint.sh"]
