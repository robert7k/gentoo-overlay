# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

if [[ ${PV} = *_beta* ]] ; then
	MY_PN="${PN/bin/beta}"
	MY_PV="${PV/_beta/-beta.}"
	MY_DEST="opt/Signal Beta"
else
	MY_PN="${PN/-bin/}"
	MY_PV="${PV}"
	MY_DEST="opt/Signal"
fi
# https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop-beta/signal-desktop-beta_1.31.0-beta.1_amd64.deb

inherit pax-utils unpacker xdg-utils

DESCRIPTION="Allows you to send and receive messages of Signal Messenger on your computer"
HOMEPAGE="https://signal.org/
	https://github.com/signalapp/Signal-Desktop"
SRC_URI="https://updates.signal.org/desktop/apt/pool/main/s/${MY_PN}/${MY_PN}_${MY_PV}_amd64.deb"

LICENSE="GPL-3 MIT MIT-with-advertising BSD-1 BSD-2 BSD Apache-2.0 ISC openssl ZLIB APSL-2 icu Artistic-2 LGPL-2.1"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE=""

RDEPEND="
	dev-libs/nss
	media-libs/mesa[X(+)]
	net-print/cups
	x11-libs/gtk+:3[X]
	x11-libs/libXScrnSaver
	x11-libs/libXtst"

QA_PREBUILT="${MY_DEST}/${MY_PN}
	${MY_DEST}/chrome-sandbox
	${MY_DEST}/libffmpeg.so
	${MY_DEST}/libGLESv2.so
	${MY_DEST}/libnode.so
	${MY_DEST}/libVkICD_mock_icd.so
	${MY_DEST}/swiftshader/libGLESv2.so"
rpath=${rpath//\$\$ORIGIN/\$ORIGIN}
S="${WORKDIR}"

src_prepare(){
	default
	sed -e 's|\("/${MY_DEST}/signal-desktop"\)|\1 --start-in-tray|g' \
		-i usr/share/applications/${MY_PN}.desktop || die
	unpack usr/share/doc/${MY_PN}/changelog.gz
	grep -rlZ '$$ORIGIN' . | xargs -0 sed -i 's|:$$ORIGIN[^"]*||' || \
		die 'Removal of $$ORIGIN failed'
}

src_install() {
	insinto /
	dodoc changelog
	doins -r opt
	insinto /usr/share
	doins -r usr/share/applications
	doins -r usr/share/icons
	fperms +x "/${MY_DEST}/${MY_PN}" "/${MY_DEST}/chrome-sandbox"
	fperms u+s "/${MY_DEST}/chrome-sandbox"
	pax-mark m "${MY_DEST}/signal-desktop" "${MY_DEST}/chrome-sandbox"

	dosym "../../${MY_DEST}/${MY_PN}" /usr/bin/${MY_PN}
	dosym ../../usr/lib64/libEGL.so "${MY_DEST}/libEGL.so"
	dosym ../../../usr/lib64/libEGL.so "${MY_DEST}/swiftshader/libEGL.so"
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_icon_cache_update
}
