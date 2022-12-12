# Maintainer: Chrysostomus @forum.manjaro.org
# Developer: pheiduck @forum.manjaro.org

pkgname=singularity-zsh-config
pkgver=0.20
pkgrel=3
pkgdesc="Zsh configuration for singularity"
arch=(any)
url="https://gitlab.com/waser-technologies/scripts/zsh/config"
_gitcommit=e19c7c5e902a3085f918fb1fc6d0c1fd43c559c8
license=('MIT')
conflicts=('grml-zsh-config' 'manjaro-zsh-config')
depends=('zsh-autosuggestions'
	'zsh-syntax-highlighting'
	'zsh-completions'
	'zsh-history-substring-search'
	'zsh'
	'pkgfile'
	'nerd-fonts-noto-sans-mono'
	'zsh-theme-powerlevel10k'
	'lsd' 'bat' 'gping' 'nvim' 'trash-cli' 'bpytop')
source=("$pkgname.tar.gz::$url/archive/$_gitcommit.tar.gz")
install=singularity-zsh-config.install
sha256sums=('c0818e1a95a5462e5f0b17b1455ccb009c40dd78acd285149a983df2c1b4a377')
backup=(root/.zshrc)

package() {
	cd ${srcdir}
	install -D -m644 $srcdir/$pkgname-$_gitcommit/.zshrc ${pkgdir}/etc/skel/.zshrc
	install -D -m644 $srcdir/$pkgname-$_gitcommit/singularity-zsh-config ${pkgdir}/usr/share/zsh/singularity-zsh-config
	install -D -m644 $srcdir/$pkgname-$_gitcommit/singularity-zsh-prompt ${pkgdir}/usr/share/zsh/singularity-zsh-prompt
	install -D -m644 $srcdir/$pkgname-$_gitcommit/zsh-maia-prompt ${pkgdir}/usr/share/zsh/zsh-maia-prompt
	install -D -m644 $srcdir/$pkgname-$_gitcommit/p10k.zsh ${pkgdir}/usr/share/zsh/p10k.zsh
	install -D -m644 $srcdir/$pkgname-$_gitcommit/command-not-found.zsh ${pkgdir}/usr/share/zsh/functions/command-not-found.zsh
	install -D -m640 $srcdir/$pkgname-$_gitcommit/rootzshrc ${pkgdir}/root/.zshrc
	chmod 750 ${pkgdir}/root
	mkdir -p $pkgdir/usr/share/zsh/scripts
	cp -r $srcdir/$pkgname-$_gitcommit/base16-shell $pkgdir/usr/share/zsh/scripts
	chmod a+x $pkgdir/usr/share/zsh/scripts/base16-shell/*
	mkdir -p $pkgdir/usr/share/zsh/aliases
	install -D -m644 $srcdir/$pkgname-$_gitcommit/.zaliases ${pkgdir}/usr/share/zsh/aliases/.zaliases
	mkdir -p $pkgdir/usr/share/zsh/functions
	install -D -m644 $srcdir/$pkgname-$_gitcommit/.zaliases ${pkgdir}/usr/share/zsh/functions/.functions
}
