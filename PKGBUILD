# Maintainer: Safwan Nayeem Yousuf <safwannayeemyousuf.com>
pkgname=ramallahos-doom-emacs-config
pkgver=1
pkgrel=1
pkgdesc="Doom Emacs config for RamallahOS"
arch=('any')
url="https://github.com/ramallahos/$pkgname"
license=('GPL')
depends=()
makedepends=('coreutils')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')
curl https://raw.githubusercontent.com/ramallahos/$pkgname/main/doom.install > doom.install
install="doom.install"

prepare() {
sudo pacman -S emacs
git clone --depth 1 --single-branch https://github.com/doomemacs/doomemacs /home/$USER/.config/emacs
/home/$USER/.config/emacs/bin/doom install
}

package() {
    cd "$pkgname"
    install -d "${pkgdir}/etc/skel/.doom.d"
    install -d "${pkgdir}/etc/skel/.doom.d/eshell"
    install -Dm 644 config.el   "${pkgdir}/etc/skel/.doom.d/config.el"
    install -Dm 644 init.el     "${pkgdir}/etc/skel/.doom.d/init.el"
    install -Dm 644 packages.el "${pkgdir}/etc/skel/.doom.d/packages.el"
    install -Dm 644 config.org  "${pkgdir}/etc/skel/.doom.d/config.org"
    install -Dm 644 doom.png    "${pkgdir}/etc/skel/.doom.d/doom.png"
    install -Dm 644 profile     "${pkgdir}/etc/skel/.doom.d/eshell/profile"
}
