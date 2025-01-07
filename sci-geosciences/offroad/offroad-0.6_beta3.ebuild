# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop git-r3 java-pkg-2 java-utils-2 java-ant-2

DESCRIPTION="Offline vector map display ported from OsmAnd"
HOMEPAGE="https://sourceforge.net/projects/offroadosm"
SRC_URI=""

EGIT_REPO_URI="https://git.code.sf.net/p/offroadosm/code offroadosm-code"
EGIT_COMMIT="fa8e57c7b734a07bb00bbc0e77e40578b0708ba6"


LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=">=virtual/jdk-11"
RDEPEND=">=virtual/jre-11"
BDEPEND=""

src_compile() {
	eant || die
}

src_install() {
	java-pkg_dojar dist/lib/*
	java-pkg_jarinto /usr/share/${PN}
	java-pkg_dojar dist/OffRoad.jar
	java-pkg_dolauncher ${PN} --jar OffRoad.jar --pwd /usr/share/${PN}
	newicon res/offroad_icon.png ${PN}.png
	make_desktop_entry ${PN} "OffRoad" ${PN} "Utility;Science;Geoscience"
}
