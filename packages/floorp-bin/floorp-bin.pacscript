pkgname="floorp-bin"
gives="floorp"
pkgver="11.27.0"
repology=("project: ${gives}")
sha256sums_amd64=("7bceaf11bf76bde39fa60f5566ff7296fc23a6f83fc5d621ba32f973559369de")
sha256sums_arm64=("851cd74cd8f947073012a5b9de1e0fb0525f6d64452fb5fbb4b11b54ec926e05")
source_amd64=("${gives}::https://github.com/Floorp-Projects/Floorp/releases/download/v${pkgver}/${gives}-${pkgver}.linux-x86_64.tar.bz2")
source_arm64=("${gives}::https://github.com/Floorp-Projects/Floorp/releases/download/v${pkgver}/${gives}-${pkgver}.linux-aarch64.tar.bz2")
url='https://floorp.app/'
pkgdesc="Firefox-based Browser build for keeping the Open, Private and Sustainable Web alive"
maintainer=("Oren Klopfer <oren@taumoda.com>")
arch=('amd64' 'arm64')

package() {
  if [[ ${CARCH} == "arm64" ]]; then
    fancy_message warn "Floorp is not running properly on ${BBlue}arm64${NC}. It should only be installed for development."
    if [[ ! -f "${METADIR}/${pkgname}-override" ]]; then
      if ask "[${BYellow}*${NC}] ${BOLD}WARNING${NC}: Cancel installation?" Y; then
        exit
      fi
    fi
    mkdir -p "${pkgdir}/${METADIR}"
    touch "${pkgdir}/${METADIR}/${pkgname}-override"
  fi
  mkdir -p "${pkgdir}/usr/lib/floorp"
  cp -r "${gives}"/* "${pkgdir}/usr/lib/floorp"
  chmod +x "${pkgdir}/usr/lib/floorp/floorp"
  chmod +x "${pkgdir}/usr/lib/floorp/floorp-bin"
  mkdir -p "${pkgdir}/usr/share/applications/"
  echo '[Desktop Entry]
Name=Floorp
Comment=Web Browser
Exec=/usr/lib/floorp/floorp --class="floorp" %u
X-MultipleArgs=false
Terminal=false
Type=Application
Icon=/usr/lib/floorp/browser/chrome/icons/default/default128.png
Categories=GNOME;GTK;Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/ftp;x-scheme-handler/chrome;video/webm;application/x-xpinstall;
StartupNotify=true
Actions=new-window;new-private-window;profile-manager-window;

[Desktop Action new-window]
Name=Open a New Window
Exec=/usr/lib/floorp/floorp --class="floorp" --new-window

[Desktop Action new-private-window]
Name=Open a New Private Window
Exec=/usr/lib/floorp/floorp --class="floorp" --private-window

[Desktop Action profile-manager-window]
Name=Open the Profile Manager
Exec=/usr/lib/floorp/floorp --class="floorp" --ProfileManager' | tee "${pkgdir}/usr/share/applications/floorp.desktop" > /dev/null
  mkdir -p "${pkgdir}/usr/bin"
  ln -sf "/lib/floorp/floorp-bin" "${pkgdir}/usr/bin/floorp-bin"
  ln -sf "/lib/floorp/floorp" "${pkgdir}/usr/bin/floorp"
}
