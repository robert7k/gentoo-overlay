# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop eutils java-pkg-2

MY_PV=$(ver_rs 1- '')

DESCRIPTION="Java key-store management tool."
SRC_URI="https://github.com/kaikramer/${PN}/releases/download/v${PV}/kse-${MY_PV}.zip"
HOMEPAGE="http://keystore-explorer.org https://github.com/kaikramer/keystore-explorer"

LICENSE="GPL-3"
IUSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=virtual/jdk-1.8"
RDEPEND=""

S="${WORKDIR}/kse-${MY_PV}"

src_install() {
	dodoc readme.txt
	java-pkg_jarinto /usr/share/${PN}
	java-pkg_dojar kse.jar
	java-pkg_jarinto /usr/share/${PN}/lib
	java-pkg_dojar lib/*.jar
	java-pkg_dolauncher "${PN}" --jar kse.jar
	newicon "icons/kse_128.png" "${PN}.png"
	make_desktop_entry "${PN}" "${PN}" "${PN}"
}
