# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit cmake

DESCRIPTION="Cross-platform Skype history exporter written in C++"
HOMEPAGE="https://github.com/Temptin/SkypeExport"
SRC_URI="https://github.com/Temptin/SkypeExport/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=dev-libs/boost-1.57
	dev-build/cmake
	sys-devel/gcc
	dev-build/make"
RDEPEND="${DEPEND}"

CMAKE_BUILD_TYPE="Release"

S="${WORKDIR}/${P}/src/${PN}/_gccbuild/linux"

src_prepare() {
	cmake_src_prepare

	sed -i '24 a #include <boost/next_prior.hpp>' "${WORKDIR}/${P}/src/SkypeExport/model/skypeparser.h"

	mkdir ${S}/release
}

src_install(){
	make

	mkdir -p ${D}usr/bin
	dobin ${WORKDIR}/${P}_build/${PN}
}
