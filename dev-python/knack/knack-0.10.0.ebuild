# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_10 )
inherit distutils-r1


DESCRIPTION="A Python command line interface framework "
HOMEPAGE="https://github.com/microsoft/knack"
SRC_URI="https://github.com/microsoft/knack/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/argcomplete[${PYTHON_USEDEP}]"

distutils_enable_tests setup.py
