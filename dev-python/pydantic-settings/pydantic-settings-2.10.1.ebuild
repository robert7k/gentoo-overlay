# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517="hatchling"
PYTHON_COMPAT=( python3_13 )
inherit distutils-r1

DESCRIPTION=" Settings management using pydantic "
HOMEPAGE="https://github.com/pydantic/pydantic-settings"
SRC_URI="https://github.com/pydantic/pydantic-settings/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/python-dotenv[${PYTHON_USEDEP}]
	dev-python/typing-inspection[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
BDEPEND=""
