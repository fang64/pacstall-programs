pkgname="librewolf-deb"
gives="librewolf"
replaces=("${gives}")
pkgdesc="A fork of Firefox, focused on privacy, security and freedom"
breaks=("${gives}-app" "${gives}-bin" "${gives}-git")
repology=("project: librewolf")
maintainer=(
  "Oren Klopfer <oren@taumoda.com>"
  "James Ed Randson <jimedrand@disroot.org>"
)
incompatible=('debian:bullseye')
arch=("amd64")
pkgver="130.0-3"
source=("https://deb.librewolf.net/pool/jammy/${gives}-${pkgver}.en-US.ubuntu22.x86_64.deb")
sha256sums=("47453fa691d7a2ffc4bacbe90c0baf74963c2c7dba55d5ab9b34acb69f2205d0")
