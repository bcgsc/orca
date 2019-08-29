FROM bcgsc/orca-6:latest
LABEL maintainer="Shaun Jackman <sjackman@gmail.com>" \
      name=bcgs/orca \
      org.label-schema.description="Genomics Research Container Architecture" \
      org.label-schema.url="http://www.bcgsc.ca/services/orca" \
      org.label-schema.vcs-url="https://github.com/bcgsc/orca" \
      org.label-schema.vendor="BC Cancer Genome Sciences Centre"

RUN sudo apt-get update \
    && sudo apt-get install -y --no-install-recommends libfontconfig1 \
    && sudo rm -rf /var/lib/apt/lists/*

RUN brew update \
&& brew upgrade \
squeakr \
xssp

RUN brew uninstall --ignore-dependencies \
apbspdb2pqr \
swig \
nxrepair \
gmap-gsnap \
meme \
nextgenmap \
repeatmasker

RUN brew install --build-from-source \
gmap-gsnap \
meme \
nextgenmap \
repeatmasker
