# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop

DESCRIPTION="An email client for Exchange and Office 365"
HOMEPAGE="https://www.hiri.com/"
SRC_URI="https://feedback.hiri.com/downloads/Hiri-x86_64-${PV}.tar.gz"

LICENSE="proprietary"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="bindist"

DEPEND="dev-libs/openssl-compat:1.0.0"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/hiri_${PV}"

QA_PREBUILT="/opt/${PN}/*.so
	/opt/${PN}/*.so.1.0.0
	/opt/${PN}/*.so.5
	/opt/${PN}/libpython3.5m.so.1.0
	/opt/${PN}/hirimain
	/opt/${PN}/QtWebEngineProcess"

src_install() {
	insinto /opt/${PN}
	doins -r $S/*

	exeinto /opt/${PN}
	doexe hiri.sh hirimain QtWebEngineProcess

	dosym /opt/${PN}/${PN}.sh /usr/bin/${PN}
	dosym /opt/${PN}/hirimain /usr/bin/hirimain
	doicon hiri.png
	make_desktop_entry ${PN} "Hiri" ${PN} "Network"
}
