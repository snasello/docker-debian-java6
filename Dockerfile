# debian wheezy + java 6u45
# 
# VERSION 0.0.1

# 0.0.1 : initial file with debian and java 6u45

FROM debian:wheezy

MAINTAINER Samuel Nasello <samuel.nasello@elosi.com>

RUN apt-get update \
	&& apt-get install -y curl \
	&& curl -s -k -L -C - -o /opt/jdk-6u45-linux-x64.bin -b "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/6u45-b06/jdk-6u45-linux-x64.bin \
	&& chmod +x /opt/jdk-6u45-linux-x64.bin \
	&& cd /opt \
	&& ./jdk-6u45-linux-x64.bin >/dev/null <<echo q >/dev/null <<echo y \
	&& rm /opt/jdk-6u45-linux-x64.bin \
	&& mv /opt/jdk1.6.0_45/jre /opt/jre1.6.0_45 \
	&& mv /opt/jdk1.6.0_45/lib/tools.jar /opt/jre1.6.0_45/lib/ext \
	&& rm -Rf /opt/jdk1.6.0_45 \
	&& ln -s /opt/jre1.6.0_45 /opt/java

# Set JAVA_HOME
ENV JAVA_HOME /opt/java

