# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{10,11,12} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Python bindings for PortAudio"
HOMEPAGE="https://github.com/spatialaudio/python-sounddevice/"
SRC_URI="https://github.com/spatialaudio/python-sounddevice/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-python/cffi[${PYTHON_USEDEP}]
	media-libs/portaudio"
RDEPEND="${DEPEND}"
