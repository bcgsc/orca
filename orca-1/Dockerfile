FROM bcgsc/orca-0:latest
LABEL maintainer="sjackan@gmail.com" name="bcgsc/orca-1"

RUN sudo apt-get install libmysqlclient-dev
# Install Python3 packages
RUN pip3 install \
--upgrade setuptools \
biopython \
cwlref-runner \
pandas \
pysam \
pyvcf \
virtualenv

# Install Python2 packages
# trans-abyss requires python-igraph.
RUN pip2 install \
biopython \
python-igraph

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
