# Image with for OpenGL applications for Von Neumann cluster at Stony Brook
# University
#
# Authors:
# Qiao Chen <benechiao@gmail.com>

FROM x11vnc/desktop:18.04
LABEL maintainer "Qiao Chen <benechiao@gmail.com>"

USER root
WORKDIR /tmp

# add customized files to system
ADD image/home $DOCKER_HOME
ADD image/share /usr/share

# Install OpenFOAM 5.0 (https://openfoam.org/download/5-0-ubuntu/) and
# FreeCAD
RUN sh -c "curl -s http://dl.openfoam.org/gpg.key | apt-key add -" && \
    add-apt-repository http://dl.openfoam.org/ubuntu && \
    add-apt-repository ppa:freecad-maintainers/freecad-stable && \
    apt-get update && \
    apt-get install -y --no-install-recommends && \
      paraviewopenfoam54 && \
      freecad && \
      freecad-doc && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR $DOCKER_HOME
