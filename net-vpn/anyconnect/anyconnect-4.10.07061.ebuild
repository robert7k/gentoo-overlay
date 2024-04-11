# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Cisco AnyConnect Client"
HOMEPAGE="https://software.cisco.com/download/home/286281283/type/282364313/release/4.10.08029"
SRC_URI="anyconnect-linux64-4.10.07061-predeploy-k9.tar.gz"
RESTRICT="fetch"

LICENSE=""
SLOT="0"
KEYWORDS=""

DEPEND="dev-libs/libxml2"
RDEPEND="${DEPEND}"
BDEPEND=""

pkg_nofetch() {
	einfo "Please download anyconnect-linux64-4.10.07061-predeploy-k9.tar.gz"
}

S="$WORKDIR/anyconnect-linux64-4.10.07061"

src_prepare() {
	sed -i "s/INSTPREFIX=/INSTPREFIX=\$D/" $S/vpn/vpn_install.sh
	sed -i "s/ROOTCERTSTORE=/ROOTCERTSTORE=\$D/" $S/vpn/vpn_install.sh
	sed -i "s|/usr/share|\$D/usr/share|" $S/vpn/vpn_install.sh
	sed -i "s|/etc|\$D/etc|" $S/vpn/vpn_install.sh

	eapply_user
}

src_install() {
	mkdir -p $D/usr/share/icons/hicolor/48x48/apps/
	mkdir -p $D/usr/share/desktop-directories/
	mkdir -p $D/usr/share/applications/
	cd $S/vpn
	yes | ./vpn_install.sh

	rm $D/usr/share/icons/hicolor/icon-theme.cache
}

