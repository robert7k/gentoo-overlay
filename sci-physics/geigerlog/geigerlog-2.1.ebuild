# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..13} )
PYTHON_REQ_USE="sqlite"
DISTUTILS_USE_PEP517=setuptools

inherit desktop python-single-r1

DESCRIPTION="A Python based GUI program to work with GQ Electronic's Geiger counters"
HOMEPAGE="https://sourceforge.net/projects/geigerlog/"
SRC_URI="https://downloads.sourceforge.net/project/geigerlog/geigerlog-v${PV}.zip"

S="${WORKDIR}/${PN}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	$(python_gen_cond_dep '
	dev-python/pyqt6[${PYTHON_USEDEP}]
	dev-python/py-cpuinfo[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/ntplib[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/paho-mqtt[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/sounddevice[${PYTHON_USEDEP}]
	')"
DEPEND="${RDEPEND}"
BDEPEND="app-arch/unzip
	$(python_gen_cond_dep '
	dev-python/setuptools[${PYTHON_USEDEP}]
	')"

PATCHES=(
	"${FILESDIR}/${P}-no-fpdf.patch"
	"${FILESDIR}/${P}-no-playsound.patch"
	"${FILESDIR}/${P}-paths.patch"
)

src_install() {
	MANUAL="${S}/gmanual/GeigerLog-Manual-v${PV}.pdf"
	dodoc ${MANUAL}
	rm ${MANUAL}
	rm -r "${S}/data"
	dodir /usr/share/${PN}
	chmod +x "${PN}.py"
	cp -r "${S}"/. "${D}/usr/share/${PN}"
	python_fix_shebang "${D}/usr/share/${PN}/gmain.py"

	sed "s|@PYTHON@|${PYTHON}|" "${FILESDIR}/${PN}.sh" | newbin - ${PN}
}
