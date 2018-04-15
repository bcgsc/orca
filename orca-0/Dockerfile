FROM linuxbrew/linuxbrew:1.6.0
LABEL maintainer="sjackman@gmail.com"

ENV HOMEBREW_NO_AUTO_UPDATE=1

# fonts-dejavu-core is required by graphviz.
RUN sudo apt-get update \
	&& sudo apt-get install -y --no-install-recommends \
		fonts-dejavu-core \
	&& sudo rm -rf /var/lib/apt/lists/*

RUN brew update \
&& brew tap brewsci/bio \
&& brew tap brewsci/science \
&& brew install \
autoconf \
automake \
berkeley-db \
cpanm \
expat \
jdk \
less \
libxml2 \
matplotlib \
miller \
mysql \
numpy \
pandoc \
perl \
python \
python@2 \
r \
ruby \
scipy \
tcsh \
unzip \
vim \
zip \
zlib
