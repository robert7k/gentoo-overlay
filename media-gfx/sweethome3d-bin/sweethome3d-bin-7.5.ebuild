# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit desktop java-utils-2

MY_P="SweetHome3D-${PV}"

DESCRIPTION="Sweet Home 3D is a free interior design application."
HOMEPAGE="http://sweethome3d.sourceforge.net/"
SRC_URI="https://sourceforge.net/projects/sweethome3d/files/SweetHome3D/${MY_P}/${MY_P}.jar"
LICENSE="GPL-3"
IUSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=virtual/jre-1.8"

RDEPEND=""

S="${WORKDIR}"

src_install() {
	java-pkg_jarinto /opt/sweethome3d/
	java-pkg_newjar "${DISTDIR}/${MY_P}.jar"
	java-pkg_dolauncher "${PN}" \
		--java_args "-Xmx2g -Djogamp.gluegen.UseTempJarCache=false"
	newicon com/eteks/sweethome3d/swing/resources/aboutIcon.png ${PN}.png
	make_desktop_entry ${PN} "SweetHome3D" ${PN}

	java-pkg_do_write_
}
