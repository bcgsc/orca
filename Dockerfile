FROM bcgsc/orca-6:2018.02.14
LABEL maintainer="Shaun Jackman <sjackman@gmail.com>" \
      org.label-schema.description="Genomics Research Container Architecture" \
      org.label-schema.url="http://www.bcgsc.ca/services/orca" \
      org.label-schema.vcs-url="https://github.com/bcgsc/orca" \
      org.label-schema.vendor="BC Cancer Genome Sciences Centre"

# fonts-dejavu-core is required by graphviz.
RUN sudo apt-get update \
	&& sudo apt-get install -y --no-install-recommends \
		fonts-dejavu-core \
	&& sudo rm -rf /var/lib/apt/lists/*

RUN brew install \
kat \
salmon

RUN brew update && brew upgrade

RUN cpanm \
Bio::Perl \
# for bowtie
Clone Sys::Info Test::Deep \
# for mlst
List::MoreUtils Moo \
# for prokka
XML::Simple

RUN Rscript -e 'install.packages(c("devtools", "ggplot2", "knitr", "rmarkdown", "tidyverse"), repos = c(CRAN = "https://cran.rstudio.com")); \
source("https://bioconductor.org/biocLite.R"); biocLite()'
