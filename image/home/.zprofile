# initialize path using the same convention as bash
# Do not customize path in this file. Set them in
# $DOCKER_HOME/.profile instead.

[ -n "$ZSH_VERSION" ] && emulate sh
    if [ -e "$DOCKER_HOME/.profile" ]; then
        . $DOCKER_HOME/.profile
    elif [ -e "$HOME/.profile" ]; then
        . $HOME/.profile
    fi
[ -n "$ZSH_VERSION" ] && emulate zsh

# source the module init gate file
source /cm/local/apps/environment-modules/current/init/zsh
# purge all modules
module purge &>/dev/null
# load commonly used OpenGL applications
module load shared
module load gmsh/4.0.4
module load visit/ubuntu/2.13.2

# add paraview path
if [[ ":$PATH:" != *":/opt/paraviewopenfoam54/bin:"* ]]; then
  export PATH=/opt/paraviewopenfoam54/bin:$PATH
fi
