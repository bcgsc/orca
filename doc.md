# Hackseq 2017

The system allows users to run graphical user interface application (e.g. `igv`), provides 100 GB hard memory and 20 GB soft memory, maps host users to Docker users inside containers and mounts team folders. 

## Overview

**Servers**: orca01.dmz.bcgsc.ca, orca02.dmz.bcgsc.ca
* 5 teams per a server
* a team shares a team’s folder
* the Docker container per a team
* each user has a home directory
* ability to run GUI applications (X11)
* the groups’ user name is the same as a name of the team

## Group creation

Add groups: `orca_users:*:1000:`, name of teams (e.g. `hackseq17_1:*:1002:`)

## User creation
* Primary group name = a name of the team = a name of the Docker container
* Secondary group name = `1000(orca_users)`
* User home directory: 
    1) create empty `.Xauthority file` (X11)  
    2) to make `brew install` work:
    ```
    mkdir -p -m775 ~/.cache/Homebrew 
    ```
    and copy  `.bashrc` from `/orca_repo/etc`
* Make sure that in `.bashrc` there is the following line:
```
alias brew='sudo -u linuxbrew HOMEBREW_NO_AUTO_UPDATE=1 /home/linuxbrew/.linuxbrew/bin/brew'
```
* Add new entries from outputs of `getent passwd` and `getent group` commands to `group_hs17` and `passwd_hs17` files in `/orca_repo/etc`.

* Add `hosts` file to the `/orca_repo/etc`:
```
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
10.9.235.200 orca ldap.orca.ca biodocker01 biodocker01.dmz.bcgsc.ca
10.9.235.202 orca02 orca02.dmz.bcgsc.ca
```
## Containers creation

Use the following script to create a container for each team. Set `PROJECT` variable for each team and run the Docker command:
```
FILES_LOCATION=/orca_repo/etc
PROJECT=hackseq17_6

docker run -t --name $PROJECT -m 100GB --memory-reservation 20GB -v $FILES_LOCATION/hosts:/etc/hosts:ro -v /projects/hackathon/2017:/home/projects -v $FILES_LOCATION/passwd_hs17:/etc/passwd:ro -v $FILES_LOCATION/group_hs17:/etc/group:ro -w /home/projects/$PROJECT -v /home/userhome:/home/userhome -v /tmp/.X11-unix:/tmp/.X11-unix --net host bcgsc/orca-hackseq:2017.10.12
```

*Details*:

`--name $PROJECT`: a name of the container = a name of the team 

`-m 100GB`: The maximum amount of memory that a container can use.
`--memory-reservation 20GB`: a soft limit, which is activated when Docker detects low memory or contention on the host machine. A server has 128 GB RAM / 5 teams = ~20 GB.

`-v $FILES_LOCATION/hosts:/etc/hosts:ro`: a flag `–h` doesn’t work with a `--net host`, so, have to mount hosts file.

`-v /projects/hackathon/2017:/home/projects`: mounts all project directories 

`-v $FILES_LOCATION/passwd_hs17:/etc/passwd:ro -v $FILES_LOCATION/group_hs17:/etc/group:ro`: maps users of the container with users of the host machine

`-w /home/projects/$PROJECT`:a work directory will be a project folder

`-v /home/userhome:/home/userhome`: mounts home directories of all users

`/tmp/.X11-unix:/tmp/.X11-unix --net host`: for running GUI application (X11)

## Log in
When a user logs in to the system the following script (`/usr/local/bin/orca.hackathon`) runs:

```
#!/bin/sh
	 
	if [ "$1" = "-c" ];then
	        cmd=`echo $2 | grep "rsync\|scp"`
	        if [ -z "$cmd" ]; then
	                echo "======================================================="
	                echo "           Welcome to BCGSC ORCA Service          "
	                echo "Only direct rsync or scp file transfer commands allowed"
	                echo "======================================================="
	        else
	            	exec $2
	        fi
	else
	 
	        USER=$(id -un)
	        TEAM=$(id -gn)
	 
	        echo "Welcome to Hackseq 2017, USER $(id -un), Your home directory is mounted under /home/userhome/$USER"
	        echo "Currently installed tools can be found via 'brew list' and '/home/linuxbrew/.linuxbrew/bin' in shell"
	        echo "You can remotely transfer data via rsync/scp to your /home/userhome/$USER directory"
	        echo "Your Hackathon project folder is mounted under /home/projects/$TEAM, please keep your raw data, scripts here"
	   
	        exec docker exec -it  -u $(id -u):$(id -g) $(id -gn) /usr/bin/env XAUTHORITY=/home/userhome/$USER/.Xauthority DISPLAY=${DISPLAY} /bin/bash -l

```

*Details*:
* The name of the container = the name of the primary group = `$(id -gn)`

* `XAUTHORITY=/home/userhome/$USER/.Xauthority`: provides a path to user’s `.Xauthority` file, otherwise it takes root’ `.Xauthority` file, since the container was created by root.
* `DISPLAY=${DISPLAY}`: provides a new `$DISPLAY` variable of the terminal.

## X11
There is option to run GUI applications inside a Docker container like using SSH with X11 forwarding. 
To run GUI application on the Linux server and display it on the local machine, a user must install specific software that depends on the OS. See the following link:
[How do I run graphical programs remotely from a Linux server?](https://uisapp2.iu.edu/confluence-prd/pages/viewpage.action?pageId=280461906)
