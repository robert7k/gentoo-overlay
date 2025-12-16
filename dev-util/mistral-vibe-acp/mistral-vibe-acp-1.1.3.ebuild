# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Mistral Vibe ACP"
HOMEPAGE="https://github.com/mistralai/mistral-vibe"
SRC_URI="https://github.com/mistralai/${PN}/releases/download/v${PV}/vibe-acp-linux-x86_64-${PV}.zip"
S=${WORKDIR}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="app-arch/unzip"

QA_PREBUILT="opt/${PN}/*"

src_install() {
	exeinto /opt/${PN}
	doexe vibe-acp
}
