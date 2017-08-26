# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

DESCRIPTION="GeigerLog is a Python based GUI program to work with GQ Electronic's GMC-300 / 320 and now also GMC-500 Geiger counters."
HOMEPAGE="https://sourceforge.net/projects/geigerlog/"
SRC_URI="https://downloads.sourceforge.net/project/geigerlog/geigerlog-scripts-v${PV}.zip"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-lang/python:2.7
	dev-python/PyQt4[phonon]
	dev-python/matplotlib
	dev-python/pyserial
	sci-libs/scipy
	"

S="${WORKDIR}/${PN}"

src_unpack() {
    unpack ${A}
    cd "${S}"
    epatch "${FILESDIR}/${PN}.patch"
}

src_install() {
	MANUAL="${S}/GeigerLog-Manual-v${PV}.pdf"
	dodoc ${MANUAL}
	rm ${MANUAL}
	rm -r "${S}/data"
	dodir /usr/share/${PN}
	cp -r ${S}/* ${D}/usr/share/${PN}
	dosym /usr/share/${PN}/${PN} /usr/bin/${PN}
}
