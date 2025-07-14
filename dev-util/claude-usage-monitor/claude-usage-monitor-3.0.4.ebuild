# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517="setuptools"
PYTHON_COMPAT=( python3_13 )
inherit distutils-r1

DESCRIPTION="A real-time terminal monitoring tool for Claude AI token usage"
HOMEPAGE="https://github.com/Maciek-roboblog/Claude-Code-Usage-Monitor"
SRC_URI="https://github.com/Maciek-roboblog/Claude-Code-Usage-Monitor/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/pydantic-settings[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/Claude-Code-Usage-Monitor-${PV}"

python_install_all() {
    distutils-r1_python_install_all
}
