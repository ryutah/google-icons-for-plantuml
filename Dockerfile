FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y software-properties-common \
 && rm -rf /var/lib/apt/lists/*

RUN add-apt-repository -y ppa:inkscape.dev/stable \
 && apt-get update \
 && apt-get install -y \
      curl \
      inkscape \
      imagemagick \
      python3-pip \
      unzip

WORKDIR /usr/local/lib

RUN curl -sL -o jdk.tar.gz https://download.java.net/openjdk/jdk17/ri/openjdk-17+35_linux-x64_bin.tar.gz \
 && tar xvf jdk.tar.gz \
 && rm jdk.tar.gz

WORKDIR /usr/local/bin

RUN curl -sL -o plantuml.jar https://github.com/plantuml/plantuml/releases/download/v1.2021.16/plantuml-1.2021.16.jar

ENV PATH=/usr/local/lib/jdk-17/bin:$PATH \
    JAVA_HOME=/usr/local/lib/jdk-17

WORKDIR /works
