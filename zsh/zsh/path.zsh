# 重複する要素を自動的に削除
typeset -U path cdpath fpath manpath

path=(
	$HOME/bin(N-/)

	/usr/local/bin(N-/)
	/usr/local/sbin(N-/)

	/usr/local/share/npm/bin(N-/)

	/usr/local/opt/ruby/bin(N-/) # vagrantより先になっているが、vagrantを使うときは切り替えられるようにしたい

	# /Applications/Vagrant/embedded/bin(N-/) # rbenvより先

	/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources(N-/) # airportコマンドなど

	/Applications/Xcode6-Beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin(N-/)

	# /usr/local/share/python(N-/) # brew pip

	$HOME/go/bin(N-/)

	$path
)
