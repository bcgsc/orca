# ORCA 
## Easy Usage of ORCA Bioformatics container

Official website: [bcgsc-orca](http://www.bcgsc.ca/services/orca/)
ORCA is a platform for bioinformatics analysis. It is suited for those wishing to conduct self-serve analysis using their own existing data. Hundreds of bioinformatics tools from [Homebrew-Science](https://github.com/Homebrew/homebrew-science) are installed in the ORCA Singularity image using [Linuxbrew](http://linuxbrew.sh/). You can check the full list of tools and versions available on ORCA, [here](https://bcgsc.github.io/orca/)

## BCGSC Servers 

Before you ssh in, check which server is less loaded, so you can log into the server that is more free! You may be prompted for your password if you have not saved it. 
```
ssh your_user@orca01.dmz.bcgsc.ca uptime; ssh your_user@orca02.dmz.bcgsc.ca uptime
```
The load average number shows the average system load calculated over given period of time in the order of 1, 5, and 15 minutes. Just ssh into either orca01 or orca02 depending on which one had lower load average numbers. 
```
ssh your_user@orca01.dmz.bcgsc.ca
```

Follow our login script to create a new user account on our system. Our script produces an overlay for you, calling: `singularity image.create --size 3000 $USER_overlay.img`, which is a 3GB image that is modifiable, persistent, and you are able to install additional tools that you'd like. 

Your distinct overlay image is layered on top of our Orca container (which is not modifiable). That way you are able to make any changes you'd like to your image, save any files in your home directory mounted on our NFS, and be able to work in an environment with hundreds of bioinformatics tools preinstalled and setup for you. Simply jump into your interactive container by calling: 
```
singularity shell --overlay $USER_overlay.img orca.simg
```

## Running Singularity on your own server or private computer

#### Singularity must be downloaded as root
[Quick start](https://singularity.lbl.gov/quickstart)
```
git clone https://github.com/singularityware/singularity.git
cd singularity
./autogen.sh
./configure --prefix=/usr/local
make
sudo make install
```

### With sudo access
Download our Singularity file [(more information here)](https://www.sylabs.io/guides/2.5.1/user-guide/quick_start.html#download-pre-built-images)

If you are accessing a computer where you have sudo, administrative access (for example, your personal laptop) you can just make the base image writeable. 

```
sudo singularity build --writable orca.simg shub://bcgsc/orca
```

### Without sudo access 
Ensure Singularity is installed on this computer already (it requires sudo to install Singularity) 

Pull the container from SingularityHub
```
singularity pull --name orca.simg shub://bcgsc/orca
```
Create a persistent overlay image that allows you to overlay a writable file system on an immutable read-only container. 
```
singularity image.create --size 3000 $USER_overlay.img
```

Jump into your interactive container to run your programs with command: 
```
singularity shell --overlay $USER_overlay.simg orca.img
```
Every time you log out then log in by typing this command again, it picks up where you left off and you are able to utilize all of our tools and any additional tools you have downloaded within the overlay. 
## Fin 
Now you are inside your container and have access to over 200 bioinformatics and analysis software applications! 
