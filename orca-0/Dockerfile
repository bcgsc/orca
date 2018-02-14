FROM linuxbrew/linuxbrew
LABEL maintainer="sjackman@gmail.com"

ENV PERL5LIB /home/linuxbrew/perl5/lib/perl5

RUN brew tap brewsci/bio brewsci/science

RUN brew install \
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
zlib

RUN ln -s python2 /home/linuxbrew/.linuxbrew/bin/python
