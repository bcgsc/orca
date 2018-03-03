FROM linuxbrew/linuxbrew:1.5.4
LABEL maintainer="sjackman@gmail.com"

# fonts-dejavu-core is required by graphviz.
RUN sudo apt-get update \
	&& sudo apt-get install -y --no-install-recommends \
		fonts-dejavu-core \
	&& sudo rm -rf /var/lib/apt/lists/*

RUN brew tap brewsci/bio \
&& brew tap brewsci/science \
&& brew install \
autoconf \
automake \
berkeley-db \
cpanm \
expat \
less \
libxml2 \
matplotlib \
miller \
mysql \
numpy \
pandoc \
perl \
python \
python3 \
r \
ruby \
scipy \
tcsh \
unzip \
vim \
zip \
zlib \
&& ln -s python2 /home/linuxbrew/.linuxbrew/bin/python
