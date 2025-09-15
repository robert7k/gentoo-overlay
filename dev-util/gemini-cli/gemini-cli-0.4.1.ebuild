# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Gemini CLI - an open-source AI agent that brings Google Gemini to your terminal"
HOMEPAGE="https://github.com/google-gemini/gemini-cli"
SRC_URI="https://github.com/google-gemini/${PN}/releases/download/v${PV}/gemini.js -> ${P}.js"
S=${WORKDIR}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	net-libs/nodejs
	sys-apps/ripgrep
"

src_prepare() {
	cp ${DISTDIR}/${P}.js ${S}/gemini.js

	default
}

src_compile() {
	# Skip, nothing to compile here.
	:
}

src_install() {
	insinto /opt/${PN}
	doins gemini.js
	fperms a+x opt/gemini-cli/gemini.js

	dodir /opt/bin
	dosym -r /opt/${PN}/gemini.js /opt/bin/gemini
}
