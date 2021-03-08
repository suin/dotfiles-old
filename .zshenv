: "パス" && {
  typeset -U path cdpath fpath manpath # 重複する要素を自動的に削除

  mypath=(
    $HOME/Documents/system/bin(N-/) # 自作コマンド等
    /usr/local/bin(N-/) # homebrew
    /usr/local/sbin(N-/) # homebrew
    /usr/local/opt/php@7.1/bin (N-/) # brew install php71
    $HOME/go/bin(N-/) # go getでインストールしたコマンド
    /usr/local/opt/ruby/bin
    /usr/local/lib/ruby/gems/2.7.0/bin
  )

  type yarn > /dev/null && {
    mypath=(
      $mypath
      $(yarn global bin)(N-/) # yarnでインストールしたコマンド
    )
  }

  mypath=(
    $mypath
    $HOME/.composer/vendor/bin # composerでインストールしたコマンド
  )

  mypath=(
    $mypath
    $HOME/.Pokemon-Terminal(N-/)
  )

  mypath=(
    $mypath
    $HOME/Documents/system/linuxenv/bin(N-/) # linuxenv
  )

  path=(
    $mypath
    $path
  )

  cdpath=(
    $HOME/Documents/system(N-/)
    /Volumes/dev(N-/)
    $cdpath
  )

  [ -f /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc ] && {
    source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
    source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
  }
}

: "環境変数" && {
  export LC_CTYPE=en_US.UTF-8 # SSHで接続した先で日本語が使えるようにする
  export LC_ALL=en_US.UTF-8   # SSHで接続した先で日本語が使えるようにする
  export JAVA_OPTS="-Dfile.encoding=UTF-8" # ScalaのREPLで日本語を使えるようにする
  export EDITOR=/usr/local/bin/vim
  export PAGER=/usr/local/bin/vimpager
  export MANPAGER=/usr/local/bin/vimpager
  export GOPATH=/Volumes/dev/go
  export COMPOSE_FILE=docker-compose.development.yml # see https://suin.io/535
  export GIT_FORGOT_DIR="$HOME/Dropbox/open/* $HOME/Dropbox/projects/*" # see http://qiita.com/suin/items/dde9204193bddefe8107
}

: "HOMEにドットファイルが沢山できる問題を防ぐ" && {
  export HISTFILE=~/.data/zsh_history # ヒストリファイル名
  export COMPDUMPFILE=~/.data/zcompdump # コマンド補完データ
  export ENHANCD_DIR=~/.data/enhancd # https://github.com/b4b4r07/enhancd ... A next-generation cd command with an interactive filter
}
