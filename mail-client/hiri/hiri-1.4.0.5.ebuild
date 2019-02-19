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

src_install() {
	insinto /opt/hiri
	doins -r $S/*

	fperms a+x /opt/hiri/hiri.sh /opt/hiri/hirimain /opt/hiri/QtWebEngineProcess

	doicon $S/hiri.png
	make_desktop_entry /opt/hiri/${PN}.sh "Hiri" ${PN} "Network"
}
