# Maintainer: Your Name <youremail@domain.com>
pkgname=asoiaf-terminal-banners-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A Song of Ice and Fire / Game of Thrones Terminal Banners - Random ANSI banners for your terminal"
arch=('any')
url="https://github.com/yourusername/asoiaf-terminal-banners"
license=('MIT')
depends=('bash')
makedepends=('chafa' 'jq')
source=() # If publishing, you'd use ("git+https://github.com/yourusername/asoiaf-terminal-banners.git")
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
  install -dm755 "$pkgdir/usr/share/asoiaf-terminal-banners/banners"
  install -m644 out/*.txt "$pkgdir/usr/share/asoiaf-terminal-banners/banners/"
  
  # Install dispatcher script to share directory
  install -dm755 "$pkgdir/usr/share/asoiaf-terminal-banners"
  install -m755 scripts/archgot "$pkgdir/usr/share/asoiaf-terminal-banners/archgot"
  
  # Install executable command to /usr/bin/archgot
  install -dm755 "$pkgdir/usr/bin"
  install -m755 scripts/archgot "$pkgdir/usr/bin/archgot"
}
