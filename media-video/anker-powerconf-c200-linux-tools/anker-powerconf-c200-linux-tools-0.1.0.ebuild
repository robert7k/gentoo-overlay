# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="CLI to control vendor-specific features of the Anker PowerConf C200 webcam"
HOMEPAGE="https://github.com/erans/anker-powerconf-c200-linux-tools"
SRC_URI="https://github.com/erans/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	dobin build/${PN}
	dodoc README.md
}
