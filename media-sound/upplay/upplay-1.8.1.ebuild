# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit qmake-utils

DESCRIPTION="A Qt-based UPnP audio Control point"
HOMEPAGE="http://www.lesbonscomptes.com/upplay"
SRC_URI="http://www.lesbonscomptes.com/upplay/downloads/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/jsoncpp:=
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtnetwork:5
		dev-qt/qtwebchannel:5
		dev-qt/qtwebengine:5
		dev-qt/qtwidgets:5
		media-libs/qtmpris
		>=net-libs/libupnpp-0.25.0"
RDEPEND="${DEPEND}"

src_prepare() {
	eapply_user

	sed -e "s:WEBPLATFORM = webkit:WEBPLATFORM = webengine:" \
		-i upplay.pro
}

src_compile() {
	eqmake5 PREFIX="/usr"
	sed -e "s:Categories=.*$:Categories=Audio;AudioVideo;:" \
		-i upplay.desktop
}

src_install() {
	emake install INSTALL_ROOT="${D}"
}
