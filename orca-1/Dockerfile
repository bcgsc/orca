FROM bcgsc/orca-0:2018.02.14
LABEL maintainer="sjackan@gmail.com"

ENV PERL5LIB /home/linuxbrew/perl5/lib/perl5

# Install Perl packages
RUN cpanm \
Apache::DBI \
Bio::Perl \
Bio::Root::Version \
Bit::Vector \
Carp::Clan \
Class::Inspector \
Clone \
DBD::SQLite \
DBD::mysql \
DBI \
DB_File \
File::Which \
HTML::Entities \
HTML::Parser \
IO::All \
IO::Prompt \
Inline \
Inline::C \
LWP \
LWP::Protocol::https \
LWP::Simple \
List::MoreUtils::XS \
Module::Build \
Moo \
Parse::RecDescent \
Perl::Unsafe::Signals \
PerlIO::gzip \
SOAP::Lite \
SVG \
Statistics::Descriptive \
Term::ReadKey \
Time::HiRes \
URI \
Unix::Processors \
Want \
XML::Parser \
XML::Simple \
forks \
forks::shared \
version

# Install Python packages
RUN pip2 install \
biopython \
cwlref-runner \
htseq \
pandas \
pysam \
python-igraph \
pyvcf \
virtualenv

# Install Ruby packages
RUN gem install \
gnuplot \
narray \
RubyInline \
terminal-table
