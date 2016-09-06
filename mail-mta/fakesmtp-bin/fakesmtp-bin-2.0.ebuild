# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"
inherit eutils

DESCRIPTION="FakeSMTP is a Free Fake SMTP Server with GUI for testing emails in applications easily."
HOMEPAGE="http://nilhcem.github.io/FakeSMTP/"
SRC_URI="http://nilhcem.github.com/FakeSMTP/downloads/fakeSMTP-latest.zip"
LICENSE="BSD"
IUSE=""
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND=">=virtual/jre-1.6.0
	dev-java/java-config:2"

RDEPEND=""

S="${WORKDIR}"
INSTDIR="/opt/fakeSMTP"
MY_PN="fakesmtp"

src_unpack() {
	unpack ${A}
	unpack ${S}/fakeSMTP-2.0.jar
	cp "$FILESDIR/fakesmtp" ${S}
}

src_install() {
	newicon ${S}/icon.gif ${MY_PN}.gif
	dodir ${INSTDIR}
	cp ${S}/fakeSMTP-2.0.jar ${D}${INSTDIR}
	dobin ${MY_PN} 
	make_desktop_entry ${MY_PN} "FakeSMTP" "${MY_PN}.gif" "Development"
}

