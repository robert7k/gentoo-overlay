# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Asyncio interface to the Pulseaudio and Pipewire libpulse library"
HOMEPAGE="https://gitlab.com/xdegaye/libpulse"
SRC_URI="https://gitlab.com/xdegaye/${PN}/-/archive/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	media-libs/libpulse
"

distutils_enable_tests pytest
