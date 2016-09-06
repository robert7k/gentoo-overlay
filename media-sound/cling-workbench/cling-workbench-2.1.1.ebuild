# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
inherit java-pkg-2 java-ant-2 eutils

DESCRIPTION="A Java based desktop application for browsing UPnP devices and interacting with their services."
HOMEPAGE="http://4thline.org/projects/cling/"
SRC_URI="http://4thline.org/projects/download/cling-distribution-${PV}.zip -> ${P}.zip"
	LICENSE="LGPL-2.1"
IUSE=""
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND=">=virtual/jre-1.6.0"
RDEPEND=">=virtual/jre-1.6.0"

S="${WORKDIR}"

src_install() {
	java-pkg_newjar "${S}/cling-distribution-${PV}/workbench/target/cling-workbench-${PV}-standalone.jar" || die "java-pkg_newjar faild"
	java-pkg_dolauncher  || die "java-pkg_dolauncher failed"
	make_desktop_entry ${PN} "Cling Workbench" ${PN} "Audio;AudioVideo"
}
