# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=poetry

inherit distutils-r1

DESCRIPTION="Mistral AI Python client"
HOMEPAGE="https://github.com/mistralai/client-python"
SRC_URI="https://files.pythonhosted.org/packages/source/m/mistralai/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="test"

RDEPEND="
    >=dev-python/httpx-0.23.0[${PYTHON_USEDEP}]
    >=dev-python/pydantic-2.0[${PYTHON_USEDEP}]
    >=dev-python/pydantic-core-2.0[${PYTHON_USEDEP}]
    >=dev-python/typing-extensions-4.0[${PYTHON_USEDEP}]
"
