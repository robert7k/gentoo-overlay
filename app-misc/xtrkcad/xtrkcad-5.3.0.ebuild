# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake desktop

DESCRIPTION="Model Railway CAD program"
HOMEPAGE="https://sourceforge.net/projects/xtrkcad-fork/"
SRC_URI="https://sourceforge.net/projects/xtrkcad-fork/files/XTrackCad/Version%20${PV}/${PN}-source-${PV}GA.tar.bz2"
S="${WORKDIR}/${PN}-source-${PV}GA"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/libzip:=
	dev-libs/mxml:=
	media-libs/freeimage:=
	x11-libs/gtk+:2"
RDEPEND="${DEPEND}"

BUILDDIR="${S}_build"

PATCHES=(
	"${FILESDIR}/${P}-fix-circular-dependency.patch"
)

src_configure() {
	local mycmakeargs=(
		# Add include path for cornu library since we removed xtrkcad-lib dependency
		-DCMAKE_CXX_FLAGS="${CXXFLAGS} -I${S}/app/bin"
		-DCMAKE_C_FLAGS="${CFLAGS} -I${S}/app/bin"
		# Force use of system libzip instead of bundled version
		-DLIBZIP_LIBRARY="/usr/lib64/libzip.so"
	)
	cmake_src_configure
}

src_install() {
	default
	cmake_src_install

	dolib.so ${BUILDDIR}/app/bin/libxtrkcad-lib.so
	dolib.so ${BUILDDIR}/app/dynstring/libdynstring.so
	dolib.so ${BUILDDIR}/app/wlib/libxtrkcad-wlib.so
	dolib.so ${BUILDDIR}/app/cJSON/libcJSON.so

	dodoc "${S}/app/lib/Readme.md"

	newicon "app/lib/${PN}.png" "${PN}.png"
	make_desktop_entry "${PN}" "XTrkCAD" "${PN}" "Graphics"
}
