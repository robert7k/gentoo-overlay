# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
# This ebuild is a modified version of ebuild from java overlay.

EAPI="6"
inherit eutils

MY_PN="SweetHome3D"

DESCRIPTION="Sweet Home 3D is a free interior design application."
HOMEPAGE="http://sweethome3d.sourceforge.net/"
SRC_URI="amd64? ( mirror://sourceforge/sweethome3d/${MY_PN}-${PV}-linux-x64.tgz )
	x86? ( mirror://sourceforge/sweethome3d/${MY_PN}-${PV}-linux-x86.tgz )"
LICENSE="GPL-3"
IUSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=virtual/jre-1.8.0"

RDEPEND=""

S="${WORKDIR}/${MY_PN}-${PV}"

src_unpack() {
	unpack ${A}
	cd ${S}
	rm -rf jre8
	epatch "${FILESDIR}/${P}-javahome.patch"
}

src_install() {
	dodir /opt/sweethome3d
	cp -r ${S}/* ${D}/opt/sweethome3d/
	dosym /opt/sweethome3d/${MY_PN} /usr/bin/${MY_PN}
	make_desktop_entry ${MY_PN} "${MY_PN}"
}

