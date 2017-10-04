FROM bcgsc/orca-6:2017.09.26
RUN Rscript -e 'install.packages(c("phytools", "tidyverse","rmarkdown", "DT" , "fuzzyjoin", "pander", "doMC", "revealjs", "devtools", "roxygen2", "data.table", "ggplot2", "knitr", "igraph", "DiagrammeR"), repos = "http://cran.us.r-project.org"); source("https://bioconductor.org/biocLite.R"); biocLite()'
RUN pip2 install http://download.pytorch.org/whl/cu80/torch-0.2.0.post3-cp27-cp27m-manylinux1_x86_64.whl \
    torchvision \
    scikit-learn

