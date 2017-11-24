# Hackseq 2017

Hackseq is a Vancouver-based hackathon focused on genomics that brings individuals with diverse backgrounds together to collaborate on scientific questions and problems in genomics. ORCA provides a comprehensive bioinformatics environment for Hackseq 2017. One major benefit of ORCA is the speed it provides to build and ship systems for Hackthon by leveraging the reusable architecture patterns of ORCA and simplified build and deployment processes.

The system provides one container per each project shared by the members of the team, and a user account for each member of the team. Each team shares a project directory, and each user has their own home directory. Graphical user interface applications such as IGV can use X11 through SSH tunnelling.

## Overview

**Servers**: orca01.dmz.bcgsc.ca, orca02.dmz.bcgsc.ca
* 5 teams per a server
* a team shares a project folder
* one Docker container per a team
* each user has a home directory
* ability to run GUI applications (X11)

## Group creation

Add groups: `orca_users:*:1000:`, name of teams (e.g. `hackseq17_1:*:1002:`)

The `orca_users` group gives them read-only access to all the project folders.
The project group (e.g. `hackseq17_1`) gives them write access to that project folder. The user's primary group determines the name of their Docker container.

## User creation
* Primary group name is a name of the team is a name of the Docker container
* Secondary group name is `1000(orca_users)`
* User home directory: 
    1) create empty `.Xauthority file` (X11)  
    2) `brew` requires write permissions to the user's `~/.cache/Homebrew` directory. To make `brew install` work:
    ```sh
    mkdir -p -m775 ~/.cache/Homebrew 
    ```
    and copy  `.bashrc` from `/orca_repo/etc`
* Ensure that in `.bashrc` there is the following line:
```
alias brew='sudo -u linuxbrew HOMEBREW_NO_AUTO_UPDATE=1 /home/linuxbrew/.linuxbrew/bin/brew'
```
* Add new entries from outputs of `getent passwd` and `getent group` commands to `group_hs17` and `passwd_hs17` files in `/orca_repo/etc`.

P.S. Don’t use `vim` editor, use `nano`, because `vim` changes the inode and bind-mounted single files don't stay in sync after inode of file changes. As result, the container doesn’t see changes.

* Add `hosts` file to the `/orca_repo/etc`:
```
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
10.9.235.200 orca ldap.orca.ca biodocker01 biodocker01.dmz.bcgsc.ca
10.9.235.202 orca02 orca02.dmz.bcgsc.ca
```
## Image creation
Manually build the image using the [Dockerfile](https://github.com/bcgsc/orca/blob/master/orca-micb405/Dockerfile). That local Dockerfile fixes a problem with writing access to the linuxbrew folder.
Only the `linuxbrew` user has right to edit the folder, not `linuxbrew` group! Thus, users from `orca_users` group must run commands under `linuxbrew` user.

```sh
docker build -t bcgsc/orca-hackseq:2017.10.12
```

## Containers creation

Use [the script `hackseq.cr.containers`](https://github.com/bcgsc/orca/blob/master/scripts/hackseq.cr.containers) to create a container for each team. Set `PROJECT` variable for each team and run the Docker command:

### Details:

`--name $PROJECT`: a name of the container is a name of the team 

`-m 100GB`: The maximum amount of memory that a container can use
`--memory-reservation 20GB`: a soft limit, which is activated when Docker detects low memory or contention on the host machine. A server has 128 GB RAM / 5 teams = ~20 GB

`-v $FILES_LOCATION/hosts:/etc/hosts:ro`: a flag `–h` doesn’t work with a `--net host`, so, have to mount hosts file

`-v /projects/hackathon/2017:/home/projects`: mounts all project directories P.S. This broke `scp`. It would be better to use `-v /projects/hackathon/2017` 

`-v $FILES_LOCATION/passwd_hs17:/etc/passwd:ro -v $FILES_LOCATION/group_hs17:/etc/group:ro`: maps users of the container with users of the host machine

`-w /home/projects/$PROJECT`: a work directory will be a project folder

`-v /home/userhome:/home/userhome`: mounts home directories of all users

`/tmp/.X11-unix:/tmp/.X11-unix --net host`: for running GUI application (X11)

P.S. If there is no a swarm on the server, you shouldn’t use `-H :4000`, otherwise you get the following error:

```
docker: Cannot connect to the Docker daemon. Is the docker daemon running on this host?.
```

## Log in
When a user logs in to the system [the script `orca-hackathon`](https://github.com/bcgsc/orca/blob/master/scripts/orca-hackathon) (`/usr/local/bin/orca.hackathon`) runs:

### Details:
* The name of the container is the name of the primary group is `$(id -gn)`

* `XAUTHORITY=/home/userhome/$USER/.Xauthority`: provides a path to user’s `.Xauthority` file, otherwise it takes root’ `.Xauthority` file, since the container was created by root
* `DISPLAY=${DISPLAY}`: provides a new `$DISPLAY` variable of the terminal

## X11
There is option to run GUI applications inside a Docker container like using SSH with X11 forwarding. 
To run GUI application on the Linux server and display it on the local machine, a user must install an X11 server that depends on the OS. See the following link:
[How do I run graphical programs remotely from a Linux server?](https://uisapp2.iu.edu/confluence-prd/pages/viewpage.action?pageId=280461906)
