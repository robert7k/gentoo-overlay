# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_10 )
inherit distutils-r1


DESCRIPTION="Microsoft Azure CLI"
HOMEPAGE="https://github.com/Azure/azure-cli"
SRC_URI="https://github.com/Azure/azure-cli/archive/refs/tags/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-libs/libffi
	dev-libs/openssl
	dev-python/azure-common[${PYTHON_USEDEP}]
	dev-python/azure-mgmt-resource[${PYTHON_USEDEP}]
	dev-python/colorama[${PYTHON_USEDEP}]
	dev-python/humanfriendly[${PYTHON_USEDEP}]
	dev-python/jmespath[${PYTHON_USEDEP}]
	dev-python/knack[${PYTHON_USEDEP}]
	dev-python/msal[${PYTHON_USEDEP}]
	dev-python/msal-extensions[${PYTHON_USEDEP}]
	dev-python/msrestazure[${PYTHON_USEDEP}]
	dev-python/pkginfo[${PYTHON_USEDEP}]
	dev-python/portalocker[${PYTHON_USEDEP}]"

S="${WORKDIR}/${PN}-${P}/src"

distutils_enable_tests setup.py

python_compile() {
	( cd "${S}"/azure-cli-core || die ; distutils-r1_python_compile )
	( cd "${S}"/azure-cli-telemetry || die ; distutils-r1_python_compile )
	( cd "${S}"/azure-cli || die ; distutils-r1_python_compile )
}

python_install() {
	( cd "${S}"/azure-cli-core || die ; distutils-r1_python_install )
	( cd "${S}"/azure-cli-telemetry || die ; distutils-r1_python_install )
	( cd "${S}"/azure-cli || die ; distutils-r1_python_install )
}


