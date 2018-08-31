FROM bcgsc/orca-0:latest
LABEL maintainer="sjackan@gmail.com" name="bcgsc/orca-1"

# Install Python2 packages
# trans-abyss requires python-igraph.
RUN pip2 install \
-U pip \
biopython \
checkm-genome \
python-igraph

# Install Python3 packages
RUN pip3 install \
--upgrade setuptools \
-U pip \
--no-cache-dir biopython \
cwlref-runner \
pandas \
pyvcf \
virtualenv

# Install R packages
RUN Rscript -e 'install.packages(repos = c(CRAN = "https://cran.rstudio.com"), c( \
"devtools", \
"ggplot2", \
"knitr", \
"rmarkdown", \
"tidyverse")); \
source("https://bioconductor.org/biocLite.R"); biocLite()'

# Install Ruby packages
RUN gem install \
gnuplot \
narray \
RubyInline \
terminal-table \
&& gem cleanup all
