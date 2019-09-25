FROM azul/zulu-openjdk:8

ENV GRADLE_URL="https://downloads.gradle.org/distributions/gradle-5.5-bin.zip"
ENV GRADLE_SHA256HASH="8d78b2ed63e7f07ad169c1186d119761c4773e681f332cfe1901045b1b0141bc"

WORKDIR /workdir

RUN  apt-get update  && apt-get upgrade -y && apt-get clean

RUN apt-get install -y                                 \
        curl                                           \
        git                                            \
        unzip                                          \
        maven                                          \
        build-essential                                \
&& apt-get clean


RUN curl  "${GRADLE_URL}" -o /tmp/gradle.zip

RUN if [ "`sha256sum /tmp/gradle.zip | cut -d' ' -f1`" != "${GRADLE_SHA256HASH}" ];\
    then \
        echo "Error. This version of gradle is corrupted."; \
        exit 1;\
    fi && \
    mkdir -p /tmp/gradle && \
    unzip -q -d /tmp/gradle /tmp/gradle.zip &&\
    cp -Rf /tmp/gradle/gradle-*/* / &&\
    rm -Rf /tmp/gradle && rm -f /tmp/gradle.zip && \
    echo "Installed gradle `gradle -v`"