ARG NAMESPACE=""
FROM ${NAMESPACE}buildenv-jme3:base

RUN set -x; \
 echo "deb [arch=arm64,ppc64el,armhf] http://ports.ubuntu.com/ubuntu-ports/ bionic main" > /etc/apt/sources.list.d/ubuntu-ports.list \
 && dpkg --add-architecture armel                      \
 && dpkg --add-architecture i386                       \
 && dpkg --add-architecture powerpc                    

RUN apt install -y \
  gcc-multilib     \
  g++-multilib     \
&& apt-get clean

RUN apt install -y            \
  gcc-8-arm-linux-gnueabihf   \
  gcc-8-arm-linux-gnueabi     \
  gcc-8-aarch64-linux-gnu     \
  g++-8-arm-linux-gnueabihf   \
  g++-8-arm-linux-gnueabi     \
  g++-8-aarch64-linux-gnu     \
&& apt-get clean
