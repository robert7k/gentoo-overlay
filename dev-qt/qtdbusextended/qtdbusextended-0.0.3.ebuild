# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit qmake-utils

DESCRIPTION="Extended DBus for Qt"
HOMEPAGE="https://github.com/nemomobile/qtdbusextended"
SRC_URI="https://github.com/nemomobile/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-qt/qtcore:5
	dev-qt/qtdbus:5"
RDEPEND="${DEPEND}"
BDEPEND=""

src_compile() {
	eqmake5 PREFIX="${EPREFIX}"/usr
}

src_install() {
	emake install INSTALL_ROOT="${D}"
}
