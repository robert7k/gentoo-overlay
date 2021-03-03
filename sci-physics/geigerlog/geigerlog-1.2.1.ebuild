# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )
PYTHON_REQ_USE="sqlite"

inherit desktop eutils python-single-r1

DESCRIPTION="A Python based GUI program to work with GQ Electronic's Geiger counters"
HOMEPAGE="https://sourceforge.net/projects/geigerlog/"
SRC_URI="https://downloads.sourceforge.net/project/geigerlog/geigerlog-v${PV}.zip"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="${PYTHON_DEPS}
	$(python_gen_cond_dep '
	dev-python/PyQt5[${PYTHON_USEDEP}]
	dev-python/PyQt5-sip[${PYTHON_USEDEP}]
	dev-python/pip[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/matplotlib[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/paho-mqtt[${PYTHON_USEDEP}]
	dev-python/pyaudio[${PYTHON_USEDEP}]
	dev-python/sounddevice[${PYTHON_USEDEP}]
	dev-python/SoundFile[${PYTHON_USEDEP}]
	')"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}"

src_prepare() {
	default

	sed -e 's|os.mkdir(gglobs.dataPath|os.makedirs(gglobs.dataPath|g' \
		-i geigerlog || die
	sed -z -e '0,/def getDataPath()/ s/dp = os.path.join(getProgPath()/dp = os.path.join(os.getenv("HOME")/' \
		-i gsup_utils.py || die
}

src_install() {
	MANUAL="${S}/GeigerLog-Manual-v${PV}.pdf"
	dodoc ${MANUAL}
	rm ${MANUAL}
	rm -r "${S}/data"
	dodir /usr/share/${PN}
	chmod +x ${PN}
	cp -r ${S}/* ${D}/usr/share/${PN}
	dosym /usr/share/${PN}/${PN} /usr/bin/${PN}
	python_fix_shebang ${D}/usr/share/${PN}/${PN}
	make_desktop_entry ${PN} GeigerLog /usr/share/${PN}/gres/icon_geigerlog.png
}
