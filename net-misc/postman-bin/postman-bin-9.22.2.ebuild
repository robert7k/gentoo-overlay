# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

DESCRIPTION="Postman is an API platform for building and using APIs."
HOMEPAGE="https://www.getpostman.com/"
SRC_URI="https://dl.pstmn.io/download/version/${PV}/linux64 -> ${P}.tar.gz"

KEYWORDS="~amd64"
LICENSE="Apache-2.0"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

RESTRICT="strip mirror"

S="${WORKDIR}/Postman/app"

QA_PREBUILT="
	opt/postman-bin/Postman
	opt/postman-bin/chrome-sandbox
	opt/postman-bin/chrome_crashpad_handler
	opt/postman-bin/libEGL.so
	opt/postman-bin/libGLESv2.so
	opt/postman-bin/libffmpeg.so
	opt/postman-bin/libvk_swiftshader.so
	opt/postman-bin/libvulkan.so.1
	opt/postman-bin/postman
	opt/postman-bin/swiftshader/libEGL.so
	opt/postman-bin/swiftshader/libGLESv2.so"

src_install() {
	insinto /opt/${PN}
	doins -r *

	exeinto /opt/${PN}
	doexe Postman
	doexe postman

	dosym /opt/${PN}/Postman /usr/bin/postman

	newicon -s 128 ${S}/resources/app/assets/icon.png postman.png

	make_desktop_entry "postman" "Postman" "/usr/share/icons/hicolor/128x128/apps/postman.png" "Development"
}
