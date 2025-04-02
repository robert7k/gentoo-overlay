# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit qmake-utils

DESCRIPTION="A Qt-based UPnP audio Control point"
HOMEPAGE="http://www.lesbonscomptes.com/upplay"
SRC_URI="http://www.lesbonscomptes.com/upplay/downloads/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

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
}

src_compile() {
	eqmake6 PREFIX="/usr"
	sed -e "s:Categories=.*$:Categories=Audio;AudioVideo;:" \
		-i upplay.desktop
}

src_install() {
	emake install INSTALL_ROOT="${D}"
}
