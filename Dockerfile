# Image with for OpenGL applications for Von Neumann cluster at Stony Brook
# University
#
# Authors:
# Qiao Chen <benechiao@gmail.com>

FROM compdatasci/vscode-desktop:20.04
LABEL maintainer "Qiao Chen <benechiao@gmail.com>"

USER root
WORKDIR /tmp

# add customized files to system
ADD image/home $DOCKER_HOME
ADD image/share /usr/share
ADD image/bin /usr/local/bin

# Install Paraview with OpenFOAM (https://openfoam.org/download/5-0-ubuntu/)
# support and FreeCAD with CalculiX support
RUN sh -c "curl -s http://dl.openfoam.org/gpg.key | apt-key add -" && \
    add-apt-repository http://dl.openfoam.org/ubuntu && \
    add-apt-repository ppa:freecad-maintainers/freecad-stable && \
    apt update && \
    apt upgrade -y && \
    apt install -y --no-install-recommends \
      paraviewopenfoam56 \
      freecad \
      calculix-ccx \
      ffmpeg \
      feh \
      pinta \
      diffuse \
      && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    mv $DOCKER_HOME/.config/lxsession/LXDE/autostart $DOCKER_HOME/.config/lxsession/LXDE/autostart.bak && \
    head -n -1 $DOCKER_HOME/.config/lxsession/LXDE/autostart.bak > $DOCKER_HOME/.config/lxsession/LXDE/autostart && \
    chmod 775 $DOCKER_HOME/.config/lxsession/LXDE/autostart && \
    chown -R $DOCKER_USER:$DOCKER_GROUP $DOCKER_HOME

WORKDIR $DOCKER_HOME
