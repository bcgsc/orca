Bootstrap: docker
From: linuxbrew/linuxbrew

%labels
MAINTAINER Tatyana Mozgacheva

%environment
PERL5LIB=/home/linuxbrew/perl5/lib/perl5
export PERL5LIB

PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH
export PATH

%post
PERL5LIB=/home/linuxbrew/perl5/lib/perl5
export PERL5LIB
PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH
export PATH
echo 'PERL5LIB='$PERL5LIB > /etc/environment
echo 'PATH='$PATH >> /etc/environment

su -c 'brew install perl -v' linuxbrew
su -c 'brew install cpanm gcc gcc@4.9 zlib expat berkeley-db -v' linuxbrew
su -c 'brew install mysql' linuxbrew
su -c 'brew install ruby' linuxbrew
su -c 'gem install gnuplot RubyInline terminal-table narray' linuxbrew

su -c 'cpanm -i List::MoreUtils::XS DBD::mysql DB_File forks Perl::Unsafe::Signals Bio::Root::Version' linuxbrew 
su -c 'cpanm -i IO::All || true' linuxbrew 
cd /home/linuxbrew/.cpanm/work/
cd $(ls)
cat build.log
su -c 'cpanm -i forks::shared Want Bit::Vector DBD::SQLite DBI File::Which IO::Prompt Inline::C PerlIO::gzip XML::Simple' linuxbrew

su -c 'cpanm -i Module::Build Class::Inspector SOAP::Lite SVG Term::ReadKey Time::HiRes XML::Parser Carp::Clan HTML::Parser LWP URI Inline Inline::C Parse::RecDescent version' linuxbrew

#PerlIO::gzip fails

# for bowtie
su -c 'cpanm -i Unix::Processors' linuxbrew
su -c 'cpanm Bio::Perl' linuxbrew

# for pip and setuptools
su -c 'brew install python' linuxbrew

ln -s python2 /home/linuxbrew/.linuxbrew/bin/python

su -c 'brew install homebrew/science/bedops' linuxbrew
su -c 'brew install python3' linuxbrew

#for cerulean
su -c 'brew install numpy' linuxbrew
su -c 'pip2 install biopython' linuxbrew
su -c 'brew install libxml2' linuxbrew
su -c 'pip2 install python-igraph' linuxbrew
su -c 'pip2 install pysam' linuxbrew
su -c 'pip2 install htseq pandas pyvcf virtualenv' linuxbrew
su -c 'pip2 install cwlref-runner' linuxbrew

su -c 'brew install tcsh' linuxbrew

su -c 'brew install homebrew/science/matplotlib' linuxbrew

su -c 'brew install scipy' linuxbrew

su -c 'brew install R' linuxbrew

sudo apt-get install zip -y

su -c 'brew install unzip' linuxbrew

su -c 'brew tap homebrew/science' linuxbrew

su -c 'cpanm -i HTML::Entities LWP::Simple LWP::Protocol::https  Statistics::Descriptive Moo' linuxbrew

#for bowtie
su -c 'cpanm -i Clone Apache::DBI' linuxbrew

#for icu4c,
sudo apt-get install wamerican

#for gcc-4.9 for testing script
su -c 'brew install miller' linuxbrew
