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

DEPEND=""
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

	fperms a+x /opt/${PN}/hiri.sh /opt/${PN}/hirimain /opt/${PN}/QtWebEngineProcess

	doicon $S/hiri.png
	make_desktop_entry /opt/${PN}/${PN}.sh "Hiri" ${PN} "Network"
}