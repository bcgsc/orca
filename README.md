# ORCA

## Genomics Research Container Architecture

ORCA is a platform for bioinformatics analysis. It is suited for those wishing to conduct self-serve analysis using their own existing data. Hundreds of bioinformatics tools from [Homebrew-Science](https://github.com/Homebrew/homebrew-science) are installed in the ORCA Docker image using [Linuxbrew](http://linuxbrew.sh). See the [Dockerfile](Dockerfile) for the complete list of installed tools, and see the [ORCA](http://www.bcgsc.ca/services/orca) web site for more information.


### Removed packages
`snap-aligner`: it is not popular and conflicts with a `snap`

`analysis`: it is not popular and conflicts with a `biopieces`

`allpaths-lg`: conflicts with `discovardenovo` (more newer one)

`meraculous`: it is not popular and trouble to fix for now
