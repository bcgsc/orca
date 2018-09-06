# The local Dockerfile, that fixes a problem with writing access to the linuxbrew folder.
# Only the `linuxbrew` user has right to edit the folder, not `linuxbrew` group!

FROM bcgsc/orca:2017.10.12
LABEL maintainer="sjackan@gmail.com" name="bcgsc/orca"

# Solution 1:
# The Dockerfile bug: chmod increases the size of image, twice!
# RUN chmod -R g+w /home/linuxbrew/.linuxbrew  >/dev/null

# Solution 2
# Allow users from `orca_users` group to run commands under 'linuxbrew' user
USER root
RUN echo '%orca_users ALL=(linuxbrew) NOPASSWD:ALL' >> /etc/sudoers
USER linuxbrew
