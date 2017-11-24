# MICB405

UBC’s course introduces students to the concepts and applications of bioinformatics research across several broad topic areas. ORCA provides a comprehensive bioinformatics environment for MICB405. One major benefit of ORCA is the speed it provides to build and ship systems for MICB405 by leveraging the reusable architecture patterns of ORCA and simplified build and deployment processes.

The system provides one container per a user and a user account for each student. Students share a course directory, and each user has their own home directory. 

## Overview

**Servers**: orca01.dmz.bcgsc.ca
* students share a course folder
* one Docker container per a user
* each user has a home directory

## Group creation

Add user to group `orca_users`.

The `orca_users` group gives them access to the course folder. 

## User creation

* User home directory:

    `brew` requires write permissions to the user's `~/.cache/Homebrew` directory. To make `brew install` work:
    ```sh
    mkdir -p -m775 ~/.cache/Homebrew 
    ```
    and copy  `.bashrc` from `/orca_repo/etc`
* Ensure that in `.bashrc` there is the following line:
```
alias brew='sudo -u linuxbrew HOMEBREW_NO_AUTO_UPDATE=1 /home/linuxbrew/.linuxbrew/bin/brew'
```
* Add new entries from outputs of `getent passwd` and `getent group` commands to `group` and `passwd` files in `/orca_repo/etc`.

P.S. Don’t use `vim` editor, use `nano`, because `vim` changes the inode and bind-mounted single files don't stay in sync after inode of file changes. As result, the container doesn’t see changes.

## Image creation
Manually build the image using the [Dockerfile](https://github.com/bcgsc/orca/blob/master/scripts/Dockerfile). That local Dockerfile fixes a problem with writing access to the linuxbrew folder.
Only the `linuxbrew` user has right to edit the folder, not `linuxbrew` group! Thus, users from `orca_users` group must run commands under `linuxbrew` user.

```sh
docker build -t bcgsc/orca:micb405
```
## Log in
When a user logs in to the system, [the script `orca`](https://github.com/bcgsc/orca/blob/master/scripts/orca) (`/usr/local/bin/orca`) runs:

### Details:
If there is NO a container with name of user name, the container is created:

`-H :4000`: if there is swarm on the server

`--name $NAME`: the name of the container is the combination of user name, “_” and user ID

`-v /projects/hackathon/micb405:/home/micb405`: mounts course directory. P.S. This broke `scp`. It would be better to use `-v /projects/hackathon/micb405`

`-v $FILES_LOCATION/passwd:/etc/passwd:ro -v $FILES_LOCATION/group:/etc/group:ro:` maps users of the container with users of the host machine

`-w /home/$USER`: a work directory will be a home directory

`-v $HOME:/home/$USER`: mounts home directory

If there is one, run the container:

`$CONTAINER`: the name of the container is the combination of user name, “_” and user ID 

P.S. If there is no a swarm on the server, you shouldn’t use `-H :4000`, otherwise you get the following error:

```
docker: Cannot connect to the Docker daemon. Is the docker daemon running on this host?.
```

Above error can arise also when the `docker.sock` file located in `/var/run` hasn't got ownership of `orca_users` group.

```sh
cd /var/run
chgrp orca_users docker.sock
```

