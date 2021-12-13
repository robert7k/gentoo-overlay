# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit desktop eutils java-pkg-2

MY_PN="SweetHome3D"

DESCRIPTION="Sweet Home 3D is a free interior design application."
HOMEPAGE="http://sweethome3d.sourceforge.net/"
SRC_URI="amd64? ( mirror://sourceforge/sweethome3d/${MY_PN}-${PV}-linux-x64.tgz )
	x86? ( mirror://sourceforge/sweethome3d/${MY_PN}-${PV}-linux-x86.tgz )"
LICENSE="GPL-3"
IUSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=virtual/jre-1.8
	>=dev-java/jnlp-api-6.0"

RDEPEND=""

QA_PREBUILT="
	opt/sweethome3d/lib/java3d-1.6/libgluegen-rt.so
	opt/sweethome3d/lib/java3d-1.6/libjogl_desktop.so
	opt/sweethome3d/lib/java3d-1.6/libnativewindow_awt.so
	opt/sweethome3d/lib/java3d-1.6/libnativewindow_x11.so
	opt/sweethome3d/lib/libj3dcore-ogl.so
	opt/sweethome3d/lib/java3d-1.6/libnativewindow_x11.so
	opt/sweethome3d/lib/java3d-1.6/libnativewindow_awt.so
	opt/sweethome3d/lib/java3d-1.6/libjogl_desktop.so
	opt/sweethome3d/lib/java3d-1.6/libgluegen_rt.so"

S="${WORKDIR}/${MY_PN}-${PV}"

src_install() {
	java-pkg_register-dependency jnlp-api
	java-pkg_jarinto /opt/sweethome3d/lib
	java-pkg_dojar lib/*.jar
	java-pkg_jarinto /opt/sweethome3d/lib/java3d-1.6
	java-pkg_dojar lib/java3d-1.6/*.jar
	insinto /opt/sweethome3d/lib
	doins lib/*.so
	insinto /opt/sweethome3d/lib/java3d-1.6
	doins lib/java3d-1.6/*.so
	java-pkg_append_ JAVA_PKG_LIBRARY /opt/sweethome3d/lib
	java-pkg_append_ JAVA_PKG_LIBRARY /opt/sweethome3d/lib/java3d-1.6
	java-pkg_dolauncher "${MY_PN}" --jar "/opt/sweethome3d/lib/${MY_PN}.jar" \
		--main com.eteks.sweethome3d.SweetHome3D \
		--java_args "-Xmx2g -Djogamp.gluegen.UseTempJarCache=false -Dcom.eteks.sweethome3d.applicationId=SweetHome3D#Installer"
	newicon ${MY_PN}Icon.png ${PN}.png
	make_desktop_entry ${MY_PN} "${MY_PN}" ${PN}

	java-pkg_do_write_
}
