ZSH_HOME="$HOME/.zsh"

# load config
for config_file ($ZSH_HOME/modules/*.zsh(N-.))
do
	source $config_file
done

# load config
source $ZSH_HOME/options.zsh
source $ZSH_HOME/prompt.zsh
source $ZSH_HOME/aliases.zsh
source $ZSH_HOME/key-bindings.zsh

source $ZSH_HOME/vendor/incr-0.2.zsh
source $ZSH_HOME/vendor/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# cdしたあとで、自動的に ls する
function chpwd() { ls -1 }
