# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3 xdg

DESCRIPTION="Unofficial desktop client for Sennheiser Smart Control"
HOMEPAGE="https://github.com/zaval/sennheiser-desktop-client"
EGIT_REPO_URI="https://github.com/zaval/sennheiser-desktop-client.git"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

BDEPEND="dev-lang/python"
DEPEND="
	dev-qt/qtbase:6[gui]
	dev-qt/qtconnectivity:6[bluetooth]
	dev-qt/qtdeclarative:6
	net-wireless/bluez
"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/fix-cmake.patch"
	"${FILESDIR}/fix-devicelistpage.patch"
	"${FILESDIR}/fix-bluetoothsocketwrapper.patch"
)

src_install() {
	cmake_src_install

	dolib.so "${BUILD_DIR}"/btuicontrols/libbtuicontrols.so
	dolib.so "${BUILD_DIR}"/gaiaV3/libgaiaV3.so

	local qmldir="/usr/$(get_libdir)/qt6/qml"
	for mod in btuicontrols gaiaV3; do
		insinto "${qmldir}/${mod}"
		doins "${BUILD_DIR}/${mod}/qmldir" "${BUILD_DIR}/${mod}/${mod}.qmltypes"
		exeinto "${qmldir}/${mod}"
		doexe "${BUILD_DIR}/${mod}/lib${mod}plugin.so"
	done
}
