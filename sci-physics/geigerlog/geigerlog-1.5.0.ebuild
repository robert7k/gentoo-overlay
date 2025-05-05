# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
PYTHON_REQ_USE="sqlite"
DISTUTILS_USE_PEP517=setuptools

inherit desktop python-single-r1

DESCRIPTION="A Python based GUI program to work with GQ Electronic's Geiger counters"
HOMEPAGE="https://sourceforge.net/projects/geigerlog/"
SRC_URI="https://downloads.sourceforge.net/project/geigerlog/geigerlog-v${PV}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="${PYTHON_DEPS}
	$(python_gen_cond_dep '
	dev-python/pyqt5[${PYTHON_USEDEP}]
	dev-python/pyqt5-sip[${PYTHON_USEDEP}]
	dev-python/pip[${PYTHON_USEDEP}]
	dev-python/py-cpuinfo[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/ntplib[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/paho-mqtt[${PYTHON_USEDEP}]
	dev-python/pyaudio[${PYTHON_USEDEP}]
	dev-python/sounddevice[${PYTHON_USEDEP}]
	dev-python/soundfile[${PYTHON_USEDEP}]
	')"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-v${PV}/${PN}"

src_prepare() {
	default

	sed -e '1s|^ ||' \
		-i geigerlog.py || die
	sed -z -e '0,/def getPathToDataDir()/ s/dp = os.path.join(getPathToProgDir()/dp = os.path.join(os.getenv("HOME")/' \
		-i gsup_utils.py || die
	sed -z -e '0,/def getPathToConfigDir()/ s/dp = os.path.join(getPathToProgDir()/dp = os.path.join(os.getenv("HOME"), ".geigerlog"/' \
		-i gsup_utils.py || die
#	sed -z -e '0,/def getPathToSettingsFile()/ s/dp = os.path.join(g.progDir/dp = os.path.join(getPathToConfigDir()/' \
#		-i gsup_utils.py || die
}

src_install() {
	MANUAL="${S}/gmanual/GeigerLog-Manual-v${PV}.pdf"
	dodoc ${MANUAL}
	rm ${MANUAL}
	rm -r "${S}/data"
	dodir /usr/share/${PN}
	chmod +x ${PN}.py
	cp -r ${S}/* ${D}/usr/share/${PN}
	dosym /usr/share/${PN}/${PN}.py /usr/bin/${PN}
	python_fix_shebang ${D}/usr/share/${PN}/${PN}.py
	make_desktop_entry ${PN}.py GeigerLog /usr/share/${PN}/gres/icon_geigerlog.png
}
