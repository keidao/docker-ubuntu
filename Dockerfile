FROM ubuntu:14.04

# daum으로 repository 변경
RUN \
#  sed -i 's/archive.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list && \
#  sed -i 's/security.ubuntu.com/ftp.daum.net/g' /etc/apt/sources.list  && \ 
  apt-get update && \
  apt-get upgrade -y
  

# 한글 설정 및 시간대 변경
ENV LANG ko_KR.UTF-8
ENV LANGUAGE ko_KR.UTF-8
ENV LC_ALL ko_KR.UTF-8

RUN \
	apt-get install -y language-pack-ko && \ 
	locale-gen ko_KR.UTF-8 && \
	ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
ADD conf/.vimrc /root/.vimrc


# 기본 개발툴 설치
RUN \
#	sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list
#	apt-get update && \
#	apt-get -y upgrade && \
	apt-get install -y build-essential && \
	apt-get install -y software-properties-common && \
	apt-get install -y byobu curl git htop man unzip vim wget && \
	rm -rf /var/lib/apt/lists/*

CMD /bin/bash