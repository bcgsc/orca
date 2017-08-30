# The local Dockerfile, that fixes a problem with writing access to the linuxbrew folder.
# Only the `linuxbrew` user has right to edit the folder, not `linuxbrew` group!

FROM bcgsc/orca-6:2017.08.23
# Solution 1:
# The Dockerfile bug: chmod increases the size of image, twice!
# RUN chmod -R g+w /home/linuxbrew/.linuxbrew  >/dev/null

# Solution 2
# Allow users from `orca_users` group to run commands under 'linuxbrew' user
USER root
RUN echo '%orca_users ALL=(linuxbrew) NOPASSWD:ALL' >> /etc/sudoers \
 && echo 'alias brew="sudo -u linuxbrew /home/linuxbrew/.linuxbrew/bin/brew"' >> ~/.bashrc
USER linuxbrew

LABEL maintainer="Tatyana Mozgacheva tmozgacheva@bcgsc.ca" \
org.label-schema.description="Genomics Research Container Architecture" \
org.label-schema.url="http://www.bcgsc.ca/services/orca" \
org.label-schema.vcs-url="https://github.com/bcgsc/orca" \
org.label-schema.vendor="BC Cancer Agency Genome Sciences Centre"
