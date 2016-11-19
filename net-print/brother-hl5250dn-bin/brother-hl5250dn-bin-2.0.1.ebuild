# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5

inherit eutils rpm linux-info
DESCRIPTION="Brother printer driver for HL-5250DN"
HOMEPAGE="http://support.brother.com"
SRC_URI="http://download.brother.com/welcome/dlf005985/cupswrapperHL5250DN-2.0.1-1.i386.rpm"
LICENSE="brother-eula"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror strip"
DEPEND="net-print/cups"
RDEPEND="${DEPEND}"

S=${WORKDIR}

pkg_setup() {
    CONFIG_CHECK=""
	if use amd64; then
		CONFIG_CHECK="${CONFIG_CHECK} ~IA32_EMULATION"
	fi

	linux-info_pkg_setup
}


src_unpack() {
	rpm_unpack ${A}
	mkdir -p ${D}/usr/local/Brother/Printer/hl5250dn/cupswrapper || die
    cp -r usr "${D}" || die

	chmod 755 ${D}/usr/local/Brother/Printer/hl5250dn/cupswrapper || die
	chmod 755 ${D}/usr/local/Brother/Printer/hl5250dn/ || die
	chmod 755 ${D}/usr/local/Brother/Printer/ || die
	chmod 755 ${D}/usr/local/Brother || die

	mkdir -p ${D}/usr/lib64/cups/filter || die

	chmod 755 ${D}/usr/lib64/cups/filter || die

	einfo "Running install script"

	${D}/usr/local/Brother/cupswrapper/cupswrapperHL5250DN-2.0.1 || die

	einfo "Install script finished"

	chmod 755 ${D}/usr/local/Brother/Printer/hl5250dn/cupswrapper || die
	mkdir -p ${D}/var/spool/lpd || die
	mkdir -p ${D}/usr/lib64/cups/filter || die
	( ln -s ${D}/usr/lib64/cups/filter/brlpdwrapperhl5250dn ${D}/usr/libexec/cups/filter/brlpdwrapperhl5250dn ) || die
}
