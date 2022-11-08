# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8,9,10} )

inherit distutils-r1

DESCRIPTION="Microsoft Azure Resource Management client library for Python"
HOMEPAGE="https://pypi.org/project/azure-mgmt-resource"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.zip"

KEYWORDS="~amd64"
LICENSE="MIT"
SLOT="0"

RDEPEND=">=dev-python/azure-core-1.18.0[${PYTHON_USEDEP}]"

DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? ( dev-python/httpretty )"

distutils_enable_tests pytest
