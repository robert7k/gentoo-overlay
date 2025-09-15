# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Usage analysis tool for Claude Code token usage and costs"
HOMEPAGE="https://github.com/ryoppippi/ccusage https://ccusage.com/"
SRC_URI="https://registry.npmjs.org/${PN}/-/${P}.tgz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=net-libs/nodejs-20.19.4
"

S=${WORKDIR}/package

src_compile() {
	# Skip, nothing to compile here.
	:
}

src_install() {
	insinto /opt/${PN}
	doins -r .

	fperms a+x opt/${PN}/dist/index.js

	dodir /opt/bin
	dosym -r /opt/${PN}/dist/index.js /opt/bin/ccusage
}
