# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module linux-info

DESCRIPTION="Reads actions from stdin and simulates keyboard/mouse input via uinput"
HOMEPAGE="https://git.sr.ht/~geb/dotool"
SRC_URI="https://git.sr.ht/~geb/dotool/archive/${PV}.tar.gz
	https://gitlab.com/api/v4/projects/35204985/packages/generic/${PN}/${PV}/${P}-deps.tar.bz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	app-text/scdoc
	x11-libs/libxkbcommon"
RDEPEND="${DEPEND}"
BDEPEND=""

pkg_pretend() {
	CONFIG_CHECK="~INPUT_UINPUT"
	check_extra_config
}

src_compile() {
	ego build -ldflags "-X main.Version=${PV}"
	scdoc < doc/dotool.1.scd >  dotool.1
}

src_install() {
	dobin dotool dotoolc dotoold
	dodoc README.md
	doman dotool.1
}



