: "オプション" && {
  autoload -U compinit && compinit # 補完機能の強化
  setopt correct # 入力しているコマンド名が間違っている場合にもしかして：を出す。
  setopt nobeep # ビープを鳴らさない
  setopt no_tify # バックグラウンドジョブが終了したらすぐに知らせる。
  unsetopt auto_menu # タブによるファイルの順番切り替えをしない
  setopt auto_pushd # cd -[tab]で過去のディレクトリにひとっ飛びできるようにする
  setopt auto_cd # ディレクトリ名を入力するだけでcdできるようにする
  setopt interactive_comments # コマンドラインでも # 以降をコメントと見なす

  : "ヒストリ" && {
    HISTFILE=$HOME/.zsh_history # ヒストリファイル名
    HISTSIZE=10000 # メモリに保存される履歴の件数
    SAVEHIST=10000 # 履歴ファイルに保存される履歴の件数
    setopt hist_ignore_dups # 直前と同じコマンドをヒストリに追加しない
    setopt hist_ignore_all_dups # 重複するコマンドは古い法を削除する
    setopt share_history # 異なるウィンドウでコマンドヒストリを共有する
    setopt hist_no_store # historyコマンドは履歴に登録しない
    setopt hist_reduce_blanks # 余分な空白は詰めて記録
    setopt hist_verify # `!!`を実行したときにいきなり実行せずコマンドを見せる
  }

  : "キーバインディング" && {
    bindkey -e # emacs キーマップを選択
    : "Ctrl-Yで上のディレクトリに移動できる" && {
      function cd-up { zle push-line && LBUFFER='builtin cd ..' && zle accept-line }
      zle -N cd-up
      bindkey "^Y" cd-up
    }
    : "Ctrl-Dでシェルからログアウトしない" && {
      setopt ignoreeof
    }
    : "Ctrl-Wでパスの文字列などをスラッシュ単位でdeleteできる" && {
      autoload -U select-word-style
      select-word-style bash
    }
    : "Ctrl-[で直前コマンドの単語を挿入できる" && {
      autoload -Uz smart-insert-last-word
      zstyle :insert-last-word match '*([[:alpha:]/\\]?|?[[:alpha:]/\\])*' # [a-zA-Z], /, \ のうち少なくとも1文字を含む長さ2以上の単語
      zle -N insert-last-word smart-insert-last-word
      bindkey '^[' insert-last-word
      # see http://qiita.com/mollifier/items/1a9126b2200bcbaf515f
    }
  }
}

: "エイリアス" && {
  alias ls="ls -G" # macOSでlsコマンドに色を付ける
  alias l="ls -la"
  alias la="ls -la"
  alias l1="ls -1"
  alias tree="tree -NC" # N: 文字化け対策, C:色をつける
  alias -g and="|" # パイプが遠いのでandを割り当てる。例えば`tail -f ./log | grep error`を`tail -f ./log and grep error`と書くことができる
  alias pul="git pull"
  alias pus="git push"
  alias com="git commit -a"
  alias add="git add -A"
  alias st="git status -s"
}

: "プラグイン" && {
  export ZPLUG_HOME=/usr/local/opt/zplug
  [ -f "$ZPLUG_HOME/init.zsh" ] || brew install zplug # zplugはHomebrewからインストール
  source $ZPLUG_HOME/init.zsh
  zplug "zsh-users/zsh-completions" # 多くのコマンドに対応する入力補完 … https://github.com/zsh-users/zsh-completions
  zplug "mafredri/zsh-async" # "sindresorhus/pure"が依存している
  zplug "sindresorhus/pure", use:pure.zsh, as:theme # 美しく最小限で高速なプロンプト … https://github.com/sindresorhus/pure
  zplug "zsh-users/zsh-syntax-highlighting", defer:2 # fishシェル風のシンタクスハイライト … https://github.com/zsh-users/zsh-syntax-highlighting
  zplug "supercrabtree/k" # git情報を含んだファイルリストを表示するコマンド … https://github.com/supercrabtree/k
  zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf # あいまい検索ができるコマンド … https://github.com/junegunn/fzf
  zplug "junegunn/fzf", as:command, use:bin/fzf-tmux # tmuxでfzfを使えるようにするプラグイン
  zplug "junegunn/fzf", use:shell/key-bindings.zsh # Ctrl-Rで履歴検索、Ctrl-Tでファイル名検索補完できる
  zplug "junegunn/fzf", use:shell/completion.zsh # cd **[TAB], vim **[TAB]などでファイル名を補完できる
  zplug "b4b4r07/enhancd", use:init.sh # cdコマンドをインタラクティブにするプラグイン … https://github.com/b4b4r07/enhancd
  zplug 'b4b4r07/gomi', as:command, from:gh-r # 消したファイルをゴミ箱から復元できるrmコマンド代替 … https://github.com/b4b4r07/gomi
  zplug check || zplug install
  zplug load
}

: "cd先のディレクトリのファイル一覧を表示する" && {
  [ -z "$ENHANCD_ROOT" ] && function chpwd { tree -L 1 } # enhancdがない場合
  [ -z "$ENHANCD_ROOT" ] || export ENHANCD_HOOK_AFTER_CD="tree -L 1" # enhancdがあるときはそのHook機構を使う
}

: "sshコマンド補完を~/.ssh/configから行う" && {
  function _ssh { compadd `fgrep 'Host ' ~/.ssh/config.* | grep -v '*' |  awk '{print $2}' | sort` }
}
