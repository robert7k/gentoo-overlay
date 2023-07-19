# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="A Kubernetes credential (exec) plugin implementing azure authentication"
HOMEPAGE="https://github.com/Azure/kubelogin"

SRC_URI="https://github.com/Azure/${PN}/archive/refs/tags/v${PV}.tar.gz
	https://gitlab.com/api/v4/projects/35204985/packages/generic/${PN}/${PV}/${P}-deps.tar.bz"
#S="${WORKDIR}"/cli-${PV}

LICENSE="Apache-2.0 BSD-2 BSD-3 ISC MIT"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
	dobin bin/linux_amd64/${PN}
	dodoc README.md
	dodoc SECURITY.md
}

