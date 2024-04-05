# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Elixir Language Server and Debug Adapter"
HOMEPAGE="https://elixir-lsp.github.io/elixir-ls/ https://github.com/elixir-lsp/elixir-ls"
SRC_URI="https://github.com/elixir-lsp/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
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
	MIX_ENV=prod mix compile
}

src_install() {
	MIX_ENV=prod mix elixir_ls.release -o ${D}/usr/share/elixir-ls
}
