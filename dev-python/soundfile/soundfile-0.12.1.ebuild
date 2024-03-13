# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{10,11,12} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="soundfile is an audio library based on libsndfile, CFFI and NumPy."
HOMEPAGE="https://github.com/bastibe/python-soundfile"
SRC_URI="https://github.com/bastibe/python-soundfile/releases/download/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="dev-python/cffi
	dev-python/numpy
	media-libs/libsndfile"
RDEPEND="${DEPEND}"
