# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"
inherit eutils

MY_PN="TIBCOJaspersoftStudio"

DESCRIPTION="Eclipse-based report development tool for JasperReports and JasperReports Server"
HOMEPAGE="http://community.jaspersoft.com/project/jaspersoft-studio"
SRC_URI="amd64? ( mirror://sourceforge/project/jasperstudio/JaspersoftStudio-${PV}/${MY_PN}-${PV}.final-linux-x86_64.tgz )
	x86? ( mirror://sourceforge/project/jasperstudio/JaspersoftStudio-${PV}/${MY_PN}-${PV}.final-linux-x86.tgz )"
LICENSE="EPL-1.0"
IUSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=virtual/jre-1.8.0"

RDEPEND=""

S="${WORKDIR}/${MY_PN}-${PV}.final"

src_unpack() {
	unpack ${A}
	cd ${S}
}

src_install() {
	dodir /opt/jaspersoft-studio
	cp -r ${S}/* ${D}/opt/jaspersoft-studio/
	dosym /opt/jaspersoft-studio/Jaspersoft\ Studio /usr/bin/${PN}
	make_desktop_entry ${PN} "Jaspersoft Studio"
}

