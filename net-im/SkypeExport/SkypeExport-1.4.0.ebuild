# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit cmake-utils

DESCRIPTION="Cross-platform Skype history exporter written in C++"
HOMEPAGE="https://github.com/Temptin/SkypeExport"
SRC_URI="https://github.com/Temptin/SkypeExport/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-libs/boost-1.57 
	dev-util/cmake
	sys-devel/gcc
	sys-devel/make"
RDEPEND="${DEPEND}"

CMAKE_BUILD_TYPE="Release"

S="${WORKDIR}/${P}/src/${PN}/_gccbuild/linux"

src_prepare() {
	cmake-utils_src_prepare

	mkdir ${S}/release
}

src_install(){
	make

	mkdir -p ${D}usr/bin
#	cp ${WORKDIR}/${P}_build/${PN} ${D}usr/bin/${PN}
	dobin ${WORKDIR}/${P}_build/${PN}
#	dobin /usr/bin/${PN}
}
