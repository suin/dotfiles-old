ZSH_HOME="$HOME/.zsh"

# load config
for config_file ($ZSH_HOME/modules/*.zsh(N-.))
do
	source $config_file
done

# load config
source $ZSH_HOME/options.zsh
source $ZSH_HOME/path.zsh
source $ZSH_HOME/prompt.zsh
source $ZSH_HOME/aliases.zsh
source $ZSH_HOME/key-bindings.zsh

source $ZSH_HOME/vendor/incr-0.2.zsh
source $ZSH_HOME/vendor/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# シンボリックリンクがリンク先になってしまうので小手先対応	
CURRENT_DIR=$(pwd | replace /Volumes/CaseSensitive/Dropbox "$HOME/Dropbox")
cd "$CURRENT_DIR"

# cdしたあとで、自動的に ls する
function chpwd() { ls -1 }

# iTerms2のタブ名を聞く
if [ "$TMUX" = "" ]; then tab; fi
