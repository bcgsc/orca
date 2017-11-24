# ORCA

ORCA is a platform for bioinformatics analysis. It is suited for those wishing to conduct self-serve analysis using their own existing data or provides a comprehensive bioinformatics environment for education or research, making results reproducible.

ORCA provides access to a menu of validated bioinformatics software and the power to use these inside a secure and private containerized environment. These private containers are backed by larger mounted storage volumes and dedicated compute nodes to ensure sufficient resources for the demanding needs of bioinformatics analysis.
ORCA is available as a Docker image that includes hundreds of preinstalled software packages by [Linuxbrew](http://linuxbrew.sh/), the package manager for Linux. ORCA is based on version 16.04 of Ubuntu Image.

ORCA itself is available under the MIT license. The software tools that it includes are licensed under various open source licenses.






## How to install Docker:

[On Mac](https://docs.docker.com/docker-for-mac/install/)

[On Linux](https://docs.docker.com/engine/installation/)

[On Windows](https://docs.docker.com/docker-for-windows/install/)

Use the following commands in the terminal to check whether you have the Docker installed:
```
docker --version

docker --help
```
## How to install ORCA
Use the following commands in the terminal to download and run ORCA image:

```
docker pull bcgsc/orca

docker run -it bcgsc/orca
```

In order to to mount a local home directory or any files inside the ORCA container, use the -v flag.

```
docker run -it -v $HOME -w $HOME bcgsc/orca
```

## Installing software in ORCA
[Linuxbrew](http://linuxbrew.sh/) is integrated with ORCA for easy installation of software.
For the installation of software through [Linuxbrew](http://linuxbrew.sh/), use the command below in the terminal:

```
brew install zsh
```
For more information about software available from Linuxbrew, please visit the [following webpage](http://formulae.brew.sh).

Linuxbrew creates and uses the below useful paths in the following ways:

* `/home/linuxbrew/.linuxbrew/bin` includes the executables and scripts in the `PATH`;
* `/home/linuxbrew/.linuxbrew/opt` includes symlinks to the most recent version of each software package;
* `/home/linuxbrew/.linuxbrew/Cellar` includes all versions of the installed software packages.
