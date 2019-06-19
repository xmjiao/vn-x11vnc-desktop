# $DOCKER_HOME/.profile: executed by the command interpreter for login shells.

# Note: It is sourced automatically when Docker or Singularity starts.
# For best compatability with Singularity images, use $DOCKER_HOME
# instead of $HOME when initializing the paths.

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$DOCKER_HOME/.bashrc" ]; then
        . "$DOCKER_HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$DOCKER_HOME/bin" -a -z "$(echo $PATH | grep $DOCKER_HOME/bin)" ] ; then
    PATH="$DOCKER_HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$DOCKER_HOME/.local/bin" -a -z "$(echo $PATH | grep $DOCKER_HOME/.local/bin)" ] ; then
    PATH="$DOCKER_HOME/.local/bin:$PATH"
fi

# initialize the configuration of zsh
if [ "$DOCKER_HOME" != "$HOME" ]; then
    # copy from $DOCKER_HOME to $HOME for Singularity
    rsync -aub $DOCKER_HOME/.zshrc $HOME/.zshrc
    rsync -aub $DOCKER_HOME/.zprofile $HOME/.zprofile
    # rsync -aub $DOCKER_HOME/.vscode $HOME/
fi

# source the module init gate file
source /cm/local/apps/environment-modules/current/init/sh
# purge all modules
module purge &>/dev/null
# load commonly used OpenGL applications
module load shared
module load gmsh/4.0.4
module load visit/ubuntu/2.13.2
module load matlab/R2017b
module load SALOME/ubuntu/9.3.0

# add paraview path
if [[ ":$PATH:" != *":/opt/paraviewopenfoam54/bin:"* ]]; then
  export PATH=/opt/paraviewopenfoam54/bin:$PATH
fi
