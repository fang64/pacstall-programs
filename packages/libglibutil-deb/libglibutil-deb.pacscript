pkgname="libglibutil-deb"
gives="libglibutil"
replaces=("${gives}")
arch=("amd64" "arm64")
repology=("project: ${gives}")
pkgver="1.0.66"
maintainer=("James Ed Randson <jimedrand@disroot.org>")
depends=("libc6" "libglib2.0-0t64")
pkgdesc="Library of glib utilities"
incompatible=("debian:bookworm" "debian:bullseye" "debian:buster" "ubuntu:jammy" "ubuntu:focal")
source_amd64=("https://repo.waydro.id/dists/noble/${gives}_${pkgver}_amd64.deb")
sha256sums_amd64=("c3f5928f8395f4d716f1d15867bd30d26211577efa82ff1dfba034d0ad290a0d")
source_arm64=("https://repo.waydro.id/dists/noble/${gives}_${pkgver}_arm64.deb")
sha256sums_arm64=("a6924cecef94f067f22995040dac5ce51d38b6189890c1d9ad73fed8caf57da6")
