FROM bcgsc/orca-0:latest
LABEL maintainer="sjackan@gmail.com"

ENV PERL5LIB /home/linuxbrew/perl5/lib/perl5

# Install Perl packages
RUN cpanm \
Bio::Perl \
# for bowtie
Clone Sys::Info Test::Deep \
# for mlst
List::MoreUtils Moo \
# for prokka
XML::Simple

# Install Python packages
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
terminal-table
