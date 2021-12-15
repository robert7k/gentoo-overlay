# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop java-pkg-2 java-utils-2

DESCRIPTION="Interactive Brokers Trader Workstation TWS"
HOMEPAGE="https://www.interactivebrokers.com/en/trading/tws.php"
SRC_URI="https://download2.interactivebrokers.com/download/unixmacosx_latest.jar"

SLOT="0"

DEPEND="virtual/jdk:1.8"
RDEPEND="virtual/jre:1.8"
BDEPEND=""
S="${WORKDIR}/IBJts"

src_unpack() {
	jar xf ${DISTDIR}/unixmacosx_latest.jar
}

src_install() {
	java-pkg_jarinto /opt/${PN}
	java-pkg_dojar jts.jar
	java-pkg_dojar total.2013.jar
	java-pkg_dolauncher ${PN} --main jclient.LoginFrame --pkg_args .
	make_desktop_entry ${PN} "Trader Workstation" ${PN}
}
