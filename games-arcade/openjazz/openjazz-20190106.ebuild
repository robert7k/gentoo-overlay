# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Free engine for Jazz Jackrabbit game"
HOMEPAGE="http://alister.eu/jazz/oj/ https://github.com/AlisterT/openjazz"
SRC_URI="https://github.com/AlisterT/openjazz/archive/refs/tags/${PV}.zip -> ${P}.zip
	jazz.zip
	xmas?  ( jazzxmas.zip )"
KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="GPL-2"
IUSE="xmas"

inherit desktop

DEPEND=">=media-libs/libsdl-1.2
	media-libs/libmodplug"
RDEPEND="$DEPEND"

pkg_nofetch() {
	[ -z "jazz.zip" ] && return
	einfo "Please download jazz.zip (and if use=xmas jazzxmas.zip) and place it into ${DISTDIR}"
}

src_unpack() {
	unpack "${P}.zip"

	mkdir data && cd data
	unpack jazz.zip
	use xmas && unpack jazzxmas.zip
}

src_install() {
	exeinto "usr/share/${PN}"
	doexe OpenJazz || die "dobin failed"
	insinto "usr/share/${PN}"
	doins -r "${WORKDIR}/data/"
	insinto "usr/share/${PN}/data"
	doins openjazz.000 openjazz.mk

	doicon unix/OpenJazz.svg
	make_desktop_entry "/usr/share/${PN}/OpenJazz /usr/share/${PN}/data" OpenJazz OpenJazz
}
