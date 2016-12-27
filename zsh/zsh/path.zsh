# 重複する要素を自動的に削除
typeset -U path cdpath fpath manpath

path=(
	$HOME/bin(N-/)
	/usr/local/bin(N-/)
	/usr/local/sbin(N-/)
	/usr/local/dbin(N-/)
	$HOME/go/bin(N-/)
	$path
)

cdpath=(
	$HOME/Dropbox/open(N-/)
	$HOME/Dropbox/projects(N-/)
	$cdpath
)
