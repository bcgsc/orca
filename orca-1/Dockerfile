FROM bcgsc/orca-0:latest
LABEL maintainer="sjackan@gmail.com" name="bcgsc/orca-1"

# Install Python2 packages
RUN pip2 install \
biopython

# Install Python3 packages
RUN pip3 install \
biopython \
cwlref-runner \
htseq \
pandas \
pysam \
python-igraph \
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
