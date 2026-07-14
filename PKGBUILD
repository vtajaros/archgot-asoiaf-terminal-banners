# Maintainer: Your Name <youremail@domain.com>
pkgname=archgot-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Game of Thrones Terminal Banners - Random ANSI banners for your terminal"
arch=('any')
url="https://github.com/yourusername/archgot"
license=('MIT')
depends=('bash')
makedepends=('chafa' 'jq')
source=() # If publishing, you'd use ("git+https://github.com/yourusername/archgot.git")
md5sums=()

build() {
  # In a real PKGBUILD, we'd cd "$srcdir/${pkgname%-git}"
  # For local testing, we are just in the repo root.
  cd "$startdir"
  ./scripts/generate_banners.sh
}

package() {
  cd "$startdir"
  
  # Install the generated text banners
  install -dm755 "$pkgdir/usr/share/archgot/banners"
  install -m644 out/*.txt "$pkgdir/usr/share/archgot/banners/"
  
  # Install the dispatcher script to a share directory so it can be sourced
  install -dm755 "$pkgdir/usr/share/archgot"
  install -m755 scripts/got-banner.sh "$pkgdir/usr/share/archgot/got-banner.sh"
}
