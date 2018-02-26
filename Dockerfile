FROM bcgsc/orca-6:2018.02.14
LABEL maintainer="Shaun Jackman <sjackman@gmail.com>" \
      org.label-schema.description="Genomics Research Container Architecture" \
      org.label-schema.url="http://www.bcgsc.ca/services/orca" \
      org.label-schema.vcs-url="https://github.com/bcgsc/orca" \
      org.label-schema.vendor="BC Cancer Genome Sciences Centre"

RUN brew install \
kat \
salmon

RUN brew update && brew upgrade
