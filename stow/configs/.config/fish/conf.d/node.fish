# Define the folder path
set -l node_modules $HOME/.node_modules

# Check if the folder exists and create it if it doesn't
if not test -d $node_modules
    mkdir -p $node_modules
end
set -gx npm_config_prefix $node_modules
set -gx PATH $node_modules/bin $PATH
