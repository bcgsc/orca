FROM linuxbrew/brew:2.0.5
LABEL maintainer="sjackman@gmail.com" name="bcgsc/orca-0"

ENV HOMEBREW_NO_AUTO_UPDATE=1

# fonts-dejavu-core is required by graphviz.
RUN sudo apt-get update \
	&& sudo apt-get install -y --no-install-recommends \
		fonts-dejavu-core \
	&& sudo rm -rf /var/lib/apt/lists/*

RUN brew update \
&& brew tap brewsci/base \
&& brew tap brewsci/bio \
&& brew tap brewsci/science \
&& brew install \
autoconf \
automake \
berkeley-db \
cpanm \
expat \
jdk \
jdk@8 \
less \
libxml2 \
man-db \
matplotlib \
miller \
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
