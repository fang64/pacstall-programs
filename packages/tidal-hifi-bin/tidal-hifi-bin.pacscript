pkgname="tidal-hifi-bin"
gives="tidal-hifi"
pkgver="5.11.0"
pkgdesc="The web version of listen.tidal.com running in electron with hifi support thanks to widevine"
repology=("project: tidal-hifi" "visiblename: tidal-hifi-bin")
source=(
  "https://github.com/Mastermindzh/tidal-hifi/releases/download/${pkgver}/tidal-hifi-${pkgver}.tar.gz"
  "icon.png::https://github.com/Mastermindzh/tidal-hifi/raw/master/build/icon.png"
  "tidal-hifi.desktop::https://aur.archlinux.org/cgit/aur.git/plain/tidal-hifi.desktop?h=tidal-hifi-bin"
)
sha256sums=(
  "a33706b05cbd897c8aa61ac9e3d876f318ca472326c6d739c589ab6fdb4ee892"
  "SKIP"
  "SKIP"
)
maintainer=("Oren Klopfer <oren@taumoda.com>")
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git")
depends=("libxss1" "libnss3" "libgtk-3-0")

package() {
  cd "${_archive}"
  # Get icon from github and install it
  install -Dm644 "${srcdir}"/icon.png "${pkgdir}/usr/share/pixmaps/${gives}.png"

  # Get desktop file and install it
  install -Dm644 "${srcdir}"/tidal-hifi.desktop -t "${pkgdir}/usr/share/applications"

  # Install the rest of the app
  install -d "${pkgdir}/opt/${gives}/" "${pkgdir}/usr/bin"

  cp -r "${srcdir}/tidal-hifi-${pkgver}/"* "${pkgdir}/opt/${gives}/"
  chmod +x "${pkgdir}/opt/${gives}/tidal-hifi"
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/opt/${gives}/tidal-hifi" "${pkgdir}/usr/bin/tidal-hifi"
}
