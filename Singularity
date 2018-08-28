Bootstrap: docker
From: linuxbrew/linuxbrew

%labels
    MAINTAINER="sjackman@gmail.com"

%runscript
	# print out software versions installed by linuxbrew
	find /Software/brew/Cellar -maxdepth 2 -print | sed 's|/Software/brew/Cellar||g' | sed 's|^/||' | grep "/" | sed 's|/|\t|' | sort | awk '{print $1, $2, "Homebrew"}' | column -t | sort -u --ignore-case

%post
    chown -R linuxbrew: /home/linuxbrew/
    chmod 777 /home/linuxbrew/.linuxbrew
    chmod 777 /home/linuxbrew/.linuxbrew/Homebrew

    mkdir /uufs /scratch

    apt-get update \
        && apt-get install -y --no-install-recommends \
                fonts-dejavu-core \
                python-setuptools \
                unzip \
        && rm -rf /var/lib/apt/lists/*
    apt-get clean

    # for brew install to work
    PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH
    echo 'PATH='$PATH >> /etc/environment

    echo "
      export PATH=/usr/local/bin:$PATH
      export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
    " >> /etc/environment

    su -c 'cd /home/linuxbrew/.linuxbrew/Homebrew && git pull' linuxbrew

    # brew can't be run as root, use as linuxbrew user
    su -c 'brew update' linuxbrew
    su -c 'brew tap brewsci/base' linuxbrew
    su -c 'brew tap brewsci/science' linuxbrew
    su -c 'brew tap brewsci/bio' linuxbrew

    su -c 'brew install \
    autoconf \
    automake \
    berkeley-db \
    cpanm \
    expat \
    jdk \
    less \
    libxml2 \
    macse \
    matplotlib \
    miller \
    mysql \
    numpy \
    pandoc \
    python \
    python@2 \
    scipy \
    tcsh \
    vim \
    zip \
    zlib' linuxbrew

    pip2 install \
    --upgrade setuptools \
    -U pip \
    biopython

    pip3 install \
    --upgrade setuptools \
    -U pip \
    --no-cache-dir biopython \
    cwlref-runner \
    pandas \
    pyvcf \
    virtualenv

    su -c 'brew install ruby' linuxbrew
    export PATH=/usr/local/lib/ruby/gems/2.0.0/bin:$PATH
    export PATH=/usr/local/opt/ruby20/bin:$PATH
    su -c 'gem install \
    gnuplot \
    narray \
    RubyInline \
    terminal-table \
    && gem cleanup all' linuxbrew

    su -c 'brew install \
    a5 \
    abacas \
    abyss \
    abyss-explorer \
    ace-corrector \
    adam \
    adapterremoval \
    afra \
    amos \
    andi \
    aragorn \
    arcs \
    art \
    artemis \
    ascp \
    astral \
    augustus \
    bali-phy \
    bam-readcount \
    bamhash \
    bamm \
    bamtools \
    bamutil \
    bandage \
    barrnap \
    bbtools \
    bcalm \
    bcftools \
    beagle \
    beast2 \
    bedops \
    bedtools \
    beetl \
    berokka \
    bfc \
    bioawk \
    biobloomtools \
    biomake \
    bioperl \
    bison \
    blast \
    blast-legacy \
    blat \
    bless \
    bonsai \
    bowtie \
    bowtie2 \
    breseq \
    busco \
    bwa \
    cannoli \
    canu \
    cap3 \
    cd-hit \
    cegma \
    celera-assembler \
    centrifuge \
    cerulean \
    circlator \
    circos \
    clark \
    clonalframeml \
    clonehd \
    clustal-omega \
    clustal-w \
    cmake \
    consel \
    curl \
    daligner \
    dazz_db \
    delly \
    dextractor \
    diamond \
    dida \
    discovar \
    disty \
    dsh-bio \
    dsk \
    dwgsim \
    e-mem \
    easel \
    edirect \
    elph \
    ema \
    emacs \
    emboss \
    exonerate  \
    fasta \
    fastani \
    fastml \
    fastp \
    fastq-tools \
    fastqc \
    fasttree \
    fastuniq \
    fastx_toolkit \
    fermi \
    fermi-lite \
    fermi2 \
    fermikit \
    figtree \
    finch-rs \
    flash \
    flex \
    flye \
    fqzcomp \
    freebayes \
    freec \
    fsa \
    fwdpp \
    gatb \
    gatk \
    geneid \
    genewise \
    genome-painter \
    genometools' linuxbrew
    
    su -c 'brew install perl' linuxbrew
    PERL5LIB=/home/linuxbrew/perl5/lib/perl5
    echo 'PERL5LIB='$PERL5LIB >> /etc/environment
