pkgname="linux-image-unsigned-stable-deb"
gives="linux-image-unsigned-6.9.1-060901-generic"
pkgver="6.9.1"
buildver="6.9.1-060901.202405171038"
arch=('arm64' 'amd64')
sha256sums_arm64=("27017710b35f2a419cc17599160befedb0c258f21b4d24ede70d8d872a81f4ac")
sha256sums_amd64=("d966470910a7d8c5355bbc50bc254ff5c408d926bef07b2ff640828cd329abfa")
source=("https://kernel.ubuntu.com/~kernel-ppa/mainline/v${pkgver}/${CARCH}/${gives}_${buildver}_${CARCH}.deb")
pkgdesc="Ubuntu Linux stable kernel (Unsigned image)"
pacdeps=("linux-headers-generic-stable-deb" "linux-modules-stable-deb")
maintainer=("Oren Klopfer <oren@taumoda.com>")
repology=("project: linux" "repo: distrowatch")
