FROM linuxbrew/linuxbrew:1.5.0
LABEL maintainer="sjackman@gmail.com"

RUN brew tap brewsci/bio \
&& brew tap brewsci/science \
&& brew install \
berkeley-db \
cpanm \
expat \
libxml2 \
matplotlib \
miller \
mysql \
numpy \
perl \
python \
python3 \
r \
ruby \
scipy \
tcsh \
unzip \
zip \
zlib \
&& ln -s python2 /home/linuxbrew/.linuxbrew/bin/python
