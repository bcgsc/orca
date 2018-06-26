FROM bcgsc/orca-6:latest
LABEL maintainer="Shaun Jackman <sjackman@gmail.com>" \
      name=bcgs/orca \
      org.label-schema.description="Genomics Research Container Architecture" \
      org.label-schema.url="http://www.bcgsc.ca/services/orca" \
      org.label-schema.vcs-url="https://github.com/bcgsc/orca" \
      org.label-schema.vendor="BC Cancer Genome Sciences Centre"

# Fix Warning: Some installed formulae are missing dependencies
RUN brew install isl libpthread-stubs xorg-protocols

# Fix trans-abyss: ImportError: No module named igraph
RUN pip2 install python-igraph
