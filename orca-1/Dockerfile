FROM linuxbrew/linuxbrew
MAINTAINER Shaun Jackman <sjackman@gmail.com> Tatyana Mozgacheva <tatyana.mozgacheva@gmail.com>
#https://github.com/bcgsc/orca/issues/2
ENV PERL5LIB /home/linuxbrew/perl5/lib/perl5
RUN brew install perl cpanm gcc zlib expat berkeley-db mysql

RUN brew install ruby

RUN gem install gnuplot RubyInline terminal-table narray

RUN cpanm -i DBD::mysql DB_File forks Perl::Unsafe::Signals Bio::Root::Version IO::All forks::shared Want Bit::Vector DBD::SQLite DBI File::Which IO::Prompt Inline::C PerlIO::gzip XML::Simple
RUN cpanm -i Module::Build Class::Inspector SOAP::Lite SVG Term::ReadKey Time::HiRes XML::Parser Carp::Clan HTML::Parser LWP URI Inline Inline::C Parse::RecDescent version
# for bowtie
RUN cpanm -i Unix::Processors
RUN cpanm Bio::Perl

RUN brew install python # for pip and setuptools
RUN brew install python3
RUN brew install numpy # for cerulean
RUN pip install biopython

RUN brew install libxml2
RUN pip install python-igraph
RUN pip install pysam
RUN pip install htseq pandas pyvcf virtualenv

RUN brew install tcsh

RUN brew install homebrew/science/matplotlib
RUN brew install scipy
 
RUN brew install R

RUN sudo apt-get install zip -y
RUN brew install unzip
RUN brew install vim

RUN brew tap homebrew/science

RUN cpanm -i HTML::Entities LWP::Simple LWP::Protocol::https  Statistics::Descriptive Moo

#for bowtie
RUN cpanm -i Clone Apache::DBI

#for icu4c,
RUN sudo apt-get install wamerican

RUN brew install miller
