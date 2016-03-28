FROM cloudcube/nodejs:4.x
MAINTAINER "zhaohaibin@outlook.com"

# ffmpeg is hosted at deb-multimedia.org
RUN \
  curl https://www.deb-multimedia.org/pool/main/d/deb-multimedia-keyring/deb-multimedia-keyring_2016.3.7_all.deb -o /tmp/deb-multimedia-keyring_2015.6.1_all.deb && \
  dpkg -i /tmp/deb-multimedia-keyring_2015.6.1_all.deb && \
  rm /tmp/deb-multimedia-keyring_2015.6.1_all.deb && \
  echo "deb http://www.deb-multimedia.org stretch main non-free" >> /etc/apt/sources.list

# install dependence software
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer \
  xfvb \
  libgconf-2-4 \
  libexif12 \
  chromium \
  netcat-traditional \
  curl \
  ffmpeg && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
# install protractor
RUN npm install -g protractor
# update webdriver
RUN webdriver-manager update

# add user node
RUN \
  adduser --home /project --uid 1000 \
  --disabled-login --disabled-password --gecos node node
