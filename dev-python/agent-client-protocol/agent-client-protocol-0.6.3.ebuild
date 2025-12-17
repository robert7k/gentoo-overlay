# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1

S="${WORKDIR}/agent_client_protocol-${PV}"

DESCRIPTION="Agent Client Protocol"
HOMEPAGE="https://github.com/mistralai/agent-client-protocol"
SRC_URI="https://files.pythonhosted.org/packages/c6/fe/147187918c5ba695db537b3088c441bcace4ac9365fae532bf36b1494769/agent_client_protocol-0.6.3.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="test"

RDEPEND="
    >=dev-python/pydantic-2.0[${PYTHON_USEDEP}]
    >=dev-python/pydantic-core-2.0[${PYTHON_USEDEP}]
"
