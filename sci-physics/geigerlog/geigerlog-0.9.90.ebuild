# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils

DESCRIPTION="A Python based GUI program to work with GQ Electronic's Geiger counters"
HOMEPAGE="https://sourceforge.net/projects/geigerlog/"
SRC_URI="https://downloads.sourceforge.net/project/geigerlog/geigerlog-scripts-v${PV}.zip"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-lang/python:3.6
	dev-python/PyQt5
	dev-python/setuptools
	dev-python/matplotlib
	>=dev-python/numpy-1.14
	sci-libs/scipy
	dev-python/pyserial
	dev-python/paho-mqtt
	dev-python/pyaudio
	"

S="${WORKDIR}/${PN}"

src_unpack() {
    unpack ${A}
    cd "${S}"
#    epatch "${FILESDIR}/${PF}.patch"
}

src_install() {
	MANUAL="${S}/GeigerLog-Manual-v${PV}.pdf"
	dodoc ${MANUAL}
	rm ${MANUAL}
	rm -r "${S}/data"
	dodir /usr/share/${PN}
	cp -r ${S}/* ${D}/usr/share/${PN}
	dosym /usr/share/${PN}/${PN} /usr/bin/${PN}
	make_desktop_entry ${PN} GeigerLog /usr/share/${PN}/gres/icon_geigerlog.png
}
