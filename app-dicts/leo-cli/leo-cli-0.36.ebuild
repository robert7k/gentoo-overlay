# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10,11,12} )
inherit distutils-r1

DESCRIPTION="A simple command line tool for http://dict.leo.org"
HOMEPAGE="https://github.com/joidegn/leo-cli"
SRC_URI="https://github.com/joidegn/leo-cli/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/tabulate[${PYTHON_USEDEP}] "
RDEPEND="${DEPEND}"
BDEPEND=""
