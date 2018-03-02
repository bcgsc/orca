FROM bcgsc/orca-6:2018.02.14

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

RUN Rscript -e 'install.packages(repos = c(CRAN = "https://cran.rstudio.com"), c( \
"devtools", \
"ggplot2", \
"knitr", \
"rmarkdown", \
"tidyverse")); \
source("https://bioconductor.org/biocLite.R"); biocLite()'
