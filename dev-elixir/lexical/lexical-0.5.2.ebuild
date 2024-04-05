# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Next-generation language server for Elixir"
HOMEPAGE="https://github.com/lexical-lsp/lexical"
SRC_URI="https://github.com/lexical-lsp/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://gitlab.com/api/v4/projects/35204985/packages/generic/${PN}/${PV}/${P}-deps.tar.bz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-lang/elixir
	dev-elixir/hex"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	mv ../deps .

	eapply_user
}

src_compile() {
	MIX_ENV=prod mix package
}

src_install() {
	insinto /usr/share/

	doins -r ${S}/_build/prod/package/*
	fperms 755 /usr/share/${PN}/bin/*.sh
}
