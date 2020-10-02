#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
#
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

#
# Language
#
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi
export PYTHONPATH="${PYTHONPATH}:/home/sam/maths-scripts"

#
# Paths
#

# haskell stuff??
export PATH="/home/sam/.local/bin:$PATH"

export PATH="/home/sam/pc-scripts:$PATH"

export PATH="/home/sam/.steam/steam/steamapps/common:$PATH"

export PATH="/home/sam/Zotero_linux-x86_64:$PATH"

export PATH="/home/sam/Applications:$PATH"
FDK_EXE="/home/sam/bin/FDK/Tools/linux"
PATH=${PATH}:"/home/sam/bin/FDK/Tools/linux"
export PATH

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path
export FDK_EXE
# added by some random thing to get CDDA working
export LD_LIBRARY_PATH=/usr/local/lib

# for sagemath
export SAGE_BROWSER="chromium"

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Editors
#
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
