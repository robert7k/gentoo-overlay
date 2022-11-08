# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9,10,11} )
inherit distutils-r1


DESCRIPTION="A Python library for file locking."
HOMEPAGE="https://github.com/WoLpH/portalocker"
SRC_URI="https://github.com/WoLpH/portalocker/releases/download/v${PV}/${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64"

