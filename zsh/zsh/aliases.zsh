# -n 行数表示, -I バイナリファイル無視, svn関係のファイルを無視
alias grep="grep --color -n -I --exclude='*.svn-*' --exclude='entries' --exclude='*/cache/*'"

# ls
alias ls="ls -G" # color for darwin
alias l="ls -la"
alias la="ls -la"
alias l1="ls -1"

# Mac Applications
alias sub="open -a Sublime\ Text\ 2"
alias cot="open -a CotEditor"
alias coda="open -a Coda\ 2"

# tree
alias tree="tree -NC" # N: 文字化け対策, C:色をつける

# PhpStorm
alias edit='open -g -a "IntelliJ IDEA 13 CE"'

# Selenium
alias selenium-chrome='java -jar selenium-server-standalone-2.33.0.jar -Dwebdirver.chrome.driver=/Users/suin/lib/chromedriver'
