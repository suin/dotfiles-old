: "パス" && {
  typeset -U path cdpath fpath manpath # 重複する要素を自動的に削除

  path=(
    $HOME/bin(N-/) # 自作コマンド等
    /usr/local/bin(N-/) # homebrew
    /usr/local/sbin(N-/) # homebrew
    $HOME/go/bin(N-/) # go getでインストールしたコマンド
    $path
  )

  path=(
    $(yarn global bin)(N-/) # yarnでインストールしたコマンド
    $path
  )

  cdpath=(
    $HOME/Dropbox/open(N-/)
    $HOME/Dropbox/projects(N-/)
    $cdpath
  )
}

: "環境変数" && {
  export LC_CTYPE=en_US.UTF-8 # SSHで接続した先で日本語が使えるようにする
  export LC_ALL=en_US.UTF-8   # SSHで接続した先で日本語が使えるようにする
  export JAVA_OPTS="-Dfile.encoding=UTF-8" # ScalaのREPLで日本語を使えるようにする
  export EDITOR=/usr/local/bin/vim
  export PAGER=/usr/local/bin/vimpager
  export MANPAGER=/usr/local/bin/vimpager
  export GOPATH=/Users/suin/go
  export COMPOSE_FILE=docker-compose.development.yml # see https://suin.io/535
  export GIT_FORGOT_DIR="$HOME/Dropbox/open/* $HOME/Dropbox/projects/*" # see http://qiita.com/suin/items/dde9204193bddefe8107
}
