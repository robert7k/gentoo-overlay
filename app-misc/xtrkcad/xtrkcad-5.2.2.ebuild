# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Model Railway CAD program"
HOMEPAGE="https://sourceforge.net/projects/xtrkcad-fork/"
SRC_URI="https://sourceforge.net/projects/xtrkcad-fork/files/XTrackCad/Version%20${PV}/${PN}-source-${PV}GA.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/libzip"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}-source-${PV}GA"
BUILDDIR="${S}_build"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX="${EPREFIX}/usr"
	)

	cmake_src_configure
}

src_install() {
	default
	cmake_src_install

	dolib.so ${BUILDDIR}/app/bin/libxtrkcad-lib.so
	dolib.so ${BUILDDIR}/app/dynstring/libdynstring.so
	dolib.so ${BUILDDIR}/app/wlib/gtklib/libxtrkcad-wlib.so
	dolib.so ${BUILDDIR}/app/cornu/libxtrkcad-cornu.so
}
