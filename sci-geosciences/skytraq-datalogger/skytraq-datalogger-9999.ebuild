# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="Tool to control Skytraq GPS data loggers."
HOMEPAGE="https://github.com/dtan4/skytraq-datalogger"
SRC_URI=""
EGIT_REPO_URI="https://github.com/dtan4/skytraq-datalogger.git"
EGIT_BRANCH="master"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="net-misc/curl"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default

	sed -i "s/^LDFLAGS = /LDFLAGS = ${LDFLAGS}\nLDLIBS = /g" Makefile
	sed -i "s/\$(LDFLAGS)/\$(LDFLAGS) \$(LDLIBS)/g" Makefile
}

src_install() {
	dobin ${PN}
	dodoc README.md
}
