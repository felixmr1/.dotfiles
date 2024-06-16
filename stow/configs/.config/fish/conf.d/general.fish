# remove greeting
set fish_greeting

# set caps to esc
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
#setxkbmap -option caps:escape

# set default editor
set -gx EDITOR nvim

# add balena CLI to path
set -gx PATH "$HOME/.local/share/balena-cli" $PATH

# add llama tools to path
set -gx PATH "$HOME/.local/share/llama" $PATH

# add MLIR tools to path
set -gx PATH "$HOME/Dev/other/llvm-project/build/bin/" $PATH

# Set CUDA home/path path
set -gx CUDA_HOME /usr/local/cuda-12.1
set -gx CUDA_PATH /usr/local/cuda-12.1

# Update PATH to include CUDA binaries
set -gx PATH $CUDA_HOME/bin $PATH

# Update LD_LIBRARY_PATH to include CUDA libraries
set -gx LD_LIBRARY_PATH $CUDA_HOME/lib64 $LD_LIBRARY_PATH
