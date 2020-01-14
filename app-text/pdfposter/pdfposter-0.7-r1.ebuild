# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Scale and tile PDF images/pages to print on multiple pages."
HOMEPAGE="http://pythonhosted.org/pdftools.pdfposter/ https://gitlab.com/pdftools/pdfposter"
EGIT_REPO_URI="https://gitlab.com/pdftools/pdfposter"
EGIT_COMMIT="v${PV}"
PYTHON_COMPAT=( python3_6 )

inherit git-r3 distutils-r1

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="
	dev-python/PyPDF2
	dev-python/setuptools
	${DEPEND}"

python_install_all() {
	distutils-r1_python_install_all
	# find "${ED}" -name '*.pth' -delete || die
	# Replace broken symlink created by install script
	dosym /usr/lib/python-exec/python3.6/pdfposter usr/bin/pdfposter
}
