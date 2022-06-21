# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

EGO_PN="github.com/cg2v/gdrive"

DESCRIPTION="Command line utility for interacting with Google Drive"
HOMEPAGE="https://github.com/cg2v/gdrive"
SRC_URI="https://github.com/cg2v/gdrive/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://gitlab.com/api/v4/projects/35204985/packages/generic/${PN}/${PV}/${P}-deps.tar.xz"

LICENSE="Apache-2.0 BSD MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_compile() {
	go build -ldflags '-w -s' -o gdrive || die
}

src_install() {
	dobin gdrive
	dodoc README.md
}
