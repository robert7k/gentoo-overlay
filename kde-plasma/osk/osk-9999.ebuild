# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake desktop git-r3 linux-info xdg

DESCRIPTION="Lightweight draggable on-screen keyboard for KDE Plasma Wayland"
HOMEPAGE="https://github.com/c26zwj/osk"
EGIT_REPO_URI="https://github.com/c26zwj/osk.git"
EGIT_BRANCH="main"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS=""

RDEPEND="
	dev-qt/qtbase:6[dbus,gui,network,widgets]
	dev-qt/qtdeclarative:6
	kde-frameworks/kglobalaccel:6
	kde-frameworks/kstatusnotifieritem:6
	kde-plasma/layer-shell-qt
"
DEPEND="${RDEPEND}"
BDEPEND="kde-frameworks/extra-cmake-modules"

pkg_pretend() {
	CONFIG_CHECK="~INPUT_UINPUT"
	check_extra_config
}

src_prepare() {
	cmake_src_prepare

	sed -i "s#^Exec=.*#Exec=osk#" osk.desktop || die
}

src_install() {
	dobin "${BUILD_DIR}/osk"
	domenu osk.desktop
	dodoc README.md FEATURES.txt
}
