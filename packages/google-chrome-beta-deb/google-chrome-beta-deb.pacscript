pkgname="google-chrome-beta-deb"
gives="google-chrome-beta"
repology=("project: google-chrome" "visiblename: ${gives}")
replaces=("${gives}")
pkgver="138.0.7204.23"
source=("https://dl.google.com/linux/chrome/deb/pool/main/g/${gives}/${gives}_${pkgver}-1_amd64.deb")
pkgdesc="The web browser built by Google - Beta channel"
sha256sums=("4d0d2627b1f309d6392d26a109b4ef1ce7d25e461a7131a2d59850d3472f4049")
arch=('amd64')
maintainer=("Oren Klopfer <oren@taumoda.com>" "James Ed Randson <jimedrand@disroot.org>")
