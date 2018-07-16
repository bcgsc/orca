# ORCA 

Official website: [bcgsc-orca](http://www.bcgsc.ca/services/orca/)
ORCA is a platform for bioinformatics analysis. It is suited for those wishing to conduct self-serve analysis using their own existing data. Hundreds of bioinformatics tools from [Homebrew-Science](https://github.com/Homebrew/homebrew-science) are installed in the ORCA Docker image using [Linuxbrew](http://linuxbrew.sh/). You can check the full list of tools and versions available on ORCA, [here](https://bcgsc.github.io/orca/)

## BCGSC Servers 

Before you ssh in, check which server is less loaded, so you can log into the server that is more free! You may be prompted for your password if you have not saved it. 
```
ssh your_user@orca01 uptime; ssh your_user@orca02 uptime
```

```
ssh orca01 orca02  (load balanced)
```

create a new user, follow the login script 
an overlay will be created for you to use and install additional things, all of which is layered on top of the base Orca container. 
`singularity image.create --size 3000 $USER_overlay.simg`

Jump into your interactive container: 
```
singularity shell --overlay $USER_overlay.simg orca.simg
```

## Other servers using our Bioinformatics Container

### With sudo access 
Download singularity as root [quick start](https://singularity.lbl.gov/quickstart)
```
git clone https://github.com/singularityware/singularity.git
cd singularity
./autogen.sh
./configure --prefix=/usr/local
make
sudo make install
```

download our Singularity file     
``` 
git clone bcgsc/orca/Singularity or something
```
```
sudo singularity build orca.simg Singularity1
```
#### OR 

If you are accessing a computer where you have sudo, administrative access (for example, your personal laptop) you can just make the base image writeable by: 
```
sudo singularity build --writable orca.simg shub://bcgsc/orca
```

### Without sudo access 

Pull the container from SingularityHub    (native images; if pre-built then use build)
```
singularity pull --name orca.simg shub://bcgsc/orca
```
Spawn a new shell within your container and start interacting with it like a small virtual machine! 
```
singularity shell orca.simg
```
## Then 
Now you are inside your container and have access to over 200 bioinformatics and analysis software applications! 
