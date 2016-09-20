# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

SRC_URI="http://alister.eu/jazz/oj/${PN}-src-${PV}.zip 
	jazz.zip
	xmas?  ( jazzxmas.zip )"
DESCRIPTION="Free engine for Jazz Jackrabbit game"
HOMEPAGE="http://alister.eu/jazz/oj/"
KEYWORDS="~x86 ~amd64"
SLOT="0"
LICENSE="GPL-2"
IUSE="xmas"
RESTRICT="fetch"

S="${WORKDIR}"
DEPEND=">=media-libs/libsdl-1.2
  media-libs/libmodplug"
RDEPEND="$DEPEND"

inherit games flag-o-matic

pkg_nofetch() {
	[ -z "jazz.zip" ] && return
	einfo "Please download jazz.zip (and if use=xmas jazzxmas.zip) and place it into ${DISTDIR}"
}

src_compile() {
#  append-ldflags -lmodplug
#  append-cxxflags -g -Wall -O2 -DUSE_SOCKETS -DSCALE -DUSE_MODPLUG -lmodplug
  sed -i -e "s/cc/c\+\+/" Makefile || die "sed Makefile failed"
  emake || die "emake failed"
}

src_install() {
dogamesbin ${PN} || die "dogamesbin failed"

insinto "${GAMES_DATADIR}"/${PN}
doins * || die "doins failed"

# optional
#doicon ${PN}.xpm
#make_desktop_entry ${PN} KickBall ${PN}.xpm

prepgamesdirs
}
