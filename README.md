# ORCA

## Genomics Research Container Architecture

ORCA is a platform for bioinformatics analysis. It is suited for those wishing to conduct self-serve analysis using their own existing data. Hundreds of bioinformatics tools from [Brewsci/bio](https://github.com/Brewsci/homebrew-bio) are installed in the ORCA Docker image using [Linuxbrew](https://linuxbrew.sh). 

To quickly get up and running with ORCA, run...

```sh
docker run -it -v$HOME:$HOME -w$HOME bcgsc/orca
```

See [versions.tsv](https://github.com/bcgsc/orca/blob/master/versions.tsv) for the complete list of installed tools, and see the [ORCA](http://www.bcgsc.ca/services/orca) web site for more information. The changes in formulae versions from the previous release of ORCA are listed at <https://bcgsc.github.io/orca/>

Configurig ORCA for local usage is provided [here](https://github.com/bcgsc/orca/blob/master/docs/user_manual.md). Configuring ORCA for use on a multi-user system is described for [Hackseq2017](https://github.com/bcgsc/orca/blob/master/docs/hackseq2017.md) and [MICB405](https://github.com/bcgsc/orca/blob/master/docs/micb405.md).

# Contributing

Interested users may contribute new bioinformatics tools, or new versions of existing tools, to [Brewsci/bio](https://github.com/brewsci/homebrew-bio), which builds binary packages for both Linux and macOS. These contributed tools will be included in the next release of ORCA.
