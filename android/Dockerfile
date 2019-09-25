ARG NAMESPACE=""
FROM ${NAMESPACE}buildenv-jme3:base

#Based on https://github.com/mreichelt/docker-android LABEL maintainer="mcreichelt@gmail.com"
WORKDIR /opt

ENV ANDROID_SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip" \
    ANDROID_HOME="/opt/android" \
    ANDROID_NDK_HOME="/opt/android/ndk-bundle"

ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/build-tools/$ANDROID_BUILD_TOOLS_VERSION:${ANDROID_NDK_HOME}

# Install Android SDK tools
RUN mkdir android && cd android && \
    curl -L ${ANDROID_SDK_URL} -o tools.zip && \
    unzip -qq tools.zip && \
    rm tools.zip

RUN yes | sdkmanager 'tools' 'platform-tools' 

RUN export LD_LIBRARY_PATH=$ANDROID_HOME/emulator/lib64/qt/lib/

# get more from `sdkmanager --list` (add '--verbose' to read long package names)
RUN yes | sdkmanager \
  'build-tools;17.0.0' \
  'build-tools;22.0.1' \
  'build-tools;25.0.3' \
  'build-tools;26.0.3' \
  'build-tools;27.0.3' \
  'build-tools;28.0.3' \
  'build-tools;29.0.2' 'cmake;3.6.4111459' 'lldb;3.1'

RUN yes | sdkmanager ndk-bundle 


ENV ANDROID_NDK_HOME ${ANDROID_HOME}/ndk-bundle
ENV ANDROID_NDK $ANDROID_HOME/ndk-bundle/

WORKDIR /workdir
