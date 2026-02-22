# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{11..13} )

inherit distutils-r1

DESCRIPTION="Forwards audio streams to DLNA devices."
HOMEPAGE="https://gitlab.com/xdegaye/pa-dlna"
SRC_URI="https://gitlab.com/xdegaye/${PN}/-/archive/${PV}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/ffmpeg-python[${PYTHON_USEDEP}]
	dev-python/libpulse[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_test() {
	epytest --ignore=pa_dlna/tests/test_config.py
}

