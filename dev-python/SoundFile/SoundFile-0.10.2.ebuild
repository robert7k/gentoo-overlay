# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )
inherit distutils-r1

DESCRIPTION="SoundFile is an audio library based on libsndfile, CFFI and NumPy."
HOMEPAGE="https://github.com/bastibe/PySoundFile"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="virtual/python-cffi
	dev-python/numpy
	media-libs/libsndfile"
RDEPEND="${DEPEND}"
BDEPEND=""
