# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit desktop unpacker

MY_PN="${PN/-bin/}"

DESCRIPTION="Advanced email client"
HOMEPAGE="https://getmailspring.com"
SRC_URI="https://github.com/Foundry376/Mailspring/releases/download/${PV}/${MY_PN}-${PV}-amd64.deb -> ${P}.deb" 

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="app-crypt/libsecret
	dev-libs/libgcrypt:0
	dev-libs/nss
	gnome-base/gconf
	gnome-base/gnome-keyring
	gnome-base/gvfs
	x11-misc/xdg-utils"
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}"

QA_PREBUILT="/opt/${PN}/*.so
	/opt/${PN}/resources/app.asar.unpacked/*.so*
	/opt/${PN}/resources/app.asar.unpacked/mailsync*
	/opt/${PN}/mailspring"

src_install() {
	dodoc -r usr/share/doc/*

	insinto /opt/${PN}
	doins -r usr/share/mailspring/*

	exeinto /opt/${PN}
	doexe usr/share/mailspring/mailspring usr/share/mailspring/{libEGL,libGLESv2,libVkICD_mock_icd,libffmpeg}.so
	dosym /opt/${PN}/${MY_PN} /usr/bin/${MY_PN}

	exeinto /opt/${PN}/resources/app.asar.unpacked/
	doexe usr/share/mailspring/resources/app.asar.unpacked/mailsync usr/share/mailspring/resources/app.asar.unpacked/mailsync.bin

	doicon usr/share/pixmaps/${MY_PN}.png
	make_desktop_entry ${MY_PN} "Mailspring" ${MY_PN} "Network"
}


