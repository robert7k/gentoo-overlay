# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3 xdg

DESCRIPTION="GPS mapping utility"
HOMEPAGE="https://github.com/Maproom/qmapshack/wiki"

EGIT_REPO_URI="https://github.com/Maproom/${PN}.git"
EGIT_BRANCH="dev"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS=""
IUSE="dbus"

RDEPEND="
	dev-libs/quazip:=
	dev-qt/qt5compat:6
	dev-qt/qtbase:6[dbus?,gui,network,sql,sqlite,widgets,xml]
	dev-qt/qtdeclarative:6
	dev-qt/qtsvg:6
	dev-qt/qttools:6[assistant,widgets]
	dev-qt/qtwebengine:6[widgets]
	media-libs/blend2d:=
	media-libs/libjpeg-turbo:=
	sci-geosciences/routino
	sci-libs/alglib:=
	sci-libs/gdal:=
	sci-libs/proj:=
"
DEPEND="${RDEPEND}"
BDEPEND="dev-qt/qttools:6[linguist]"

src_prepare() {
	sed -i 's/^get_target_property(BLEND2D_IFACE_INCLUDE_DIRS blend2d .*//' CMakeLists.txt || die
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DUSE_QT6DBus=$(usex dbus)
		-DHTML_INSTALL_DIR="${EPREFIX}/usr/share/doc/${PF}/qch"
		-DFETCHCONTENT_TRY_FIND_PACKAGE_MODE=ALWAYS
		-DFETCHCONTENT_FULLY_DISCONNECTED=ON
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install

	docompress -x "/usr/share/doc/${PF}/qch"
}
