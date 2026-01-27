# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit qmake-utils

DESCRIPTION="A Qt-based UPnP audio Control point"
HOMEPAGE="https://www.lesbonscomptes.com/upplay/"
SRC_URI="https://www.lesbonscomptes.com/upplay/downloads/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/jsoncpp:=
		dev-qt/qtbase:6
		dev-qt/qtwebchannel:6
		dev-qt/qtwebengine:6
		>=net-libs/libupnpp-1.0"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user

	sed -e "s:WEBPLATFORM = webkit:WEBPLATFORM = webengine:" \
		-i upplay.pro

	# Remove pre-generated Makefiles with wrong qmake paths
	rm -f amber-mpris/Makefile amber-mpris/*/Makefile amber-mpris/.qmake.stash
}

src_compile() {
	eqmake6 PREFIX="/usr"
	emake
	sed -e "s:Categories=.*$:Categories=Audio;AudioVideo;:" \
		-i upplay.desktop
}

src_install() {
	emake install INSTALL_ROOT="${D}"
}
