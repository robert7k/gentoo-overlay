# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_13 )
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1

DESCRIPTION="Minimal CLI coding agent by Mistral"
HOMEPAGE="https://github.com/mistralai/mistral-vibe"
SRC_URI="https://github.com/mistralai/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="test"

RDEPEND="
    >=dev-python/agent-client-protocol-0.6.3[${PYTHON_USEDEP}]
    >=dev-python/aiofiles-24.1.0[${PYTHON_USEDEP}]
    >=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
    >=dev-python/mcp-1.14.0[${PYTHON_USEDEP}]
    >=dev-python/mistralai-1.9.11[${PYTHON_USEDEP}]
    >=dev-python/pexpect-4.9.0[${PYTHON_USEDEP}]
    >=dev-python/packaging-24.1[${PYTHON_USEDEP}]
    dev-python/pydantic[${PYTHON_USEDEP}]
    dev-python/pydantic-settings[${PYTHON_USEDEP}]
    >=dev-python/python-dotenv-1.0.0[${PYTHON_USEDEP}]
    >=dev-python/rich-14.0.0[${PYTHON_USEDEP}]
    >=dev-python/textual-6.9.0[${PYTHON_USEDEP}]
    >=dev-python/tomli-w-1.2.0[${PYTHON_USEDEP}]
    dev-python/watchfiles[${PYTHON_USEDEP}]
    >=dev-python/pyperclip-1.11.0[${PYTHON_USEDEP}]
    dev-python/textual_speedups[${PYTHON_USEDEP}]
"

BDEPEND="
    dev-python/editables[${PYTHON_USEDEP}]
"
