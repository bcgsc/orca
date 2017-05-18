FROM linuxbrew/linuxbrew
MAINTAINER Shaun Jackman <sjackman@gmail.com>

# ENV PERL5LIB /home/linuxbrew/perl5/lib/perl5
# RUN brew install cpanm
# For edirect
# RUN cpanm HTML::Entities LWP::Simple LWP::Protocol::https

RUN brew tap homebrew/science
RUN brew install \ 
a5 \
abacas \
abyss-explorer \
abyss \
ace-corrector \
adam 
# RUN brew install adapterremoval
RUN brew install afra \
allpaths-lg \
# RUN brew install amos
analysis \
andi \
# RUN brew install anvio
arcs \
art \
artemis \
astral \
atram 
# RUN brew install augustus
RUN brew install bam-readcount \
bamhash \
bamm \
bamtools \
bamutil \
barrnap \
bbtools \
bcalm \
bcftools \
beagle \
beast \
beast2 \
bedops \
bedtools \
beetl \
bfc \
bioawk \
biobloomtools \
biointerchange \
biomake \
# RUN brew install biopieces
blasr \
blast \
# RUN brew install blat
# RUN brew install bless
bowtie \
bowtie2 \
bpipe \
breseq \
busco \
bwa 
RUN brew install canu
RUN brew install cap3
RUN brew install cd-hit
# RUN brew install cegma
RUN brew install celera-assembler
RUN brew install centrifuge
RUN brew install cerulean
RUN brew install circlator
RUN brew install clark
RUN brew install clonalframeml
RUN brew install clonehd
RUN brew install clustal-omega
RUN brew install clustal-w
# RUN brew install corset
RUN brew install cytoscape
RUN brew install daligner
RUN brew install dazz_db
# RUN brew install delly
RUN brew install dextractor
RUN brew install diamond
RUN brew install dida
RUN brew install discovar
# RUN brew install discovardenovo
RUN brew install dsk
RUN brew install dwgsim
RUN brew install e-mem
# RUN brew install edirect
# RUN brew install ensembl-tools
RUN brew install exonerate
RUN brew install express
RUN brew install fasta
RUN brew install fastml
RUN brew install fastq-tools
RUN brew install fastqc
RUN brew install fasttree
RUN brew install fastuniq
RUN brew install fastx_toolkit
RUN brew install fermi-lite
RUN brew install fermi
RUN brew install fermi2
RUN brew install fermikit
RUN brew install flash
RUN brew install freebayes
RUN brew install freec
RUN brew install fsa
RUN brew install fwdpp
# RUN brew install gaemr
# RUN brew install garli
RUN brew install gatb
# RUN brew install gatk
RUN brew install geneid
# RUN brew install genewise
# RUN brew install genometools
RUN brew install gingr
RUN brew install glimmerhmm
# RUN brew install gmap-gsnap
RUN brew install grabix
# RUN brew install graphlan
RUN brew install gubbins
# RUN brew install harvest-tools
RUN brew install hisat
RUN brew install hisat2
RUN brew install hlaminer
RUN brew install hmmer
RUN brew install hmmer2
RUN brew install htsbox
RUN brew install htslib
RUN brew install humann2
RUN brew install idba
#RUN brew install igv
#RUN brew install igvtools
RUN brew install impute2
RUN brew install infernal
RUN brew install iqtree
RUN brew install iva
RUN brew install jellyfish-1.1
RUN brew install jellyfish
RUN brew install kaiju \
kallisto \
# RUN brew install kat
kent-tools \
kmacs \
kmc \
kmergenie \
# RUN brew install kmerstream
kollector \
kraken
RUN brew install last \
libbigwig \
libpll \
libsequence \
links-scaffolder \
lobstr \
lsd \
lumpy-sv
RUN brew install macse \
mafft \
# RUN brew install maker
mapsembler2 \
maq \
mash \
# RUN brew install masurca
mcl \
megahit \
# RUN brew install meme
# RUN brew install metaphlan
mhap \
minced \
minia \
miniasm \
minimap \
mir-prefer \
# RUN brew install mira
mitofy \
# RUN brew install mlst
# RUN brew install mothur
mrbayes \
multi-worm-tracker \
mummer \
muscle 
RUN brew install nanopolish \
# RUN brew install ncbi-c++-toolkit
ncl \
newick-utils \
newicktools \
nextflow \
nonpareil \
novoalign \
ntcard \
nxtrim 
RUN brew install oases
# RUN brew install ogdraw
RUN brew install oma
# RUN brew install orthofinder
RUN brew install paml
RUN brew install pandaseq
RUN brew install parsnp
RUN brew install pathd8
RUN brew install pathvisio
# RUN brew install pbsuite
RUN brew install pear
RUN brew install phipack
RUN brew install phlawd
RUN brew install phylip
RUN brew install phyml
RUN brew install phyx
RUN brew install picard-tools
RUN brew install piler
RUN brew install pilercr
RUN brew install pilon
RUN brew install plink
# RUN brew install plink2
RUN brew install poa
# RUN brew install populations
# RUN brew install poretools
RUN brew install prodigal
# RUN brew install prokka
RUN brew install proteinortho
RUN brew install psmc
# RUN brew install quaff
# RUN brew install quake
# RUN brew install quast
RUN brew install quest
RUN brew install quorum
RUN brew install racon \
# RUN brew install rampart
rapsearch2 \
raxml \
# RUN brew install ray
rcorrector \
readseq \
readsim \
# RUN brew install reapr
recon \
repeatmasker \
repeatmodeler \
repeatscout \
rmblast \
rna-star \
rnammer \
ropebwt2
RUN brew install sailfish \
salmon \
sambamba \
samblaster \
# RUN brew install samtools-0.1
samtools \
scarpa \
sdsl-lite \
seqan \
seqtk \
sequel \
sga \
shrimp \
# RUN brew install simulate-pcr
skewer \
smalt \
# RUN brew install smrtanalysis
snap-aligner \
# RUN brew install snap
snoscan \
snp-sites \
snpeff \
soapdenovo \
# RUN brew install sortmerna
spaced \
spades \
spici \
squeezambler \
sratoolkit \
ssake \
stringtie \
swarm
RUN brew install tagdust \ 
tasr \
tbl2asn \
tophat \
# RUN brew install trans-abyss
# RUN brew install trans_proteomic_pipeline
transdecoder \
transrate-tools \
trf \
trimadap \
trimal \
trimmomatic \
trinity \
trnascan 
# RUN brew install ucsc-genome-browser
RUN brew install uproc
RUN brew install vague
RUN brew install varscan
RUN brew install vcake
RUN brew install vcflib
RUN brew install vcftools
RUN brew install velvet
RUN brew install viennarna
RUN brew install vsearch
RUN brew install vt
RUN brew install weblogo
# RUN brew install wiggletools
RUN brew install yaha
