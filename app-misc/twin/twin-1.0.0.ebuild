# Copyright 2026 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Text mode window environment"
HOMEPAGE="https://github.com/cosmos72/twin"

SRC_URI="https://github.com/cosmos72/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="gpm X"

RDEPEND="
	sys-libs/ncurses:=
	virtual/libcrypt:=
	virtual/zlib:=
	gpm? ( sys-libs/gpm )
	X? (
		media-libs/freetype:2
		x11-libs/libX11
		x11-libs/libXft
	)
"
DEPEND="
	${RDEPEND}
	X? (
		media-libs/fontconfig
		x11-base/xorg-proto
	)
"
BDEPEND="virtual/pkgconfig"

src_configure() {
	econf \
		$(use_enable gpm hw-tty-linux) \
		$(use_enable X hw-x11 hw-xft x)
}

src_install() {
	default
	find "${ED}" -name '*.la' -delete || die
}
