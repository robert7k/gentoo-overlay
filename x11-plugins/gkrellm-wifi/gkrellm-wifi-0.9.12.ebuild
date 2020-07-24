# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit multilib

DESCRIPTION="A GKrellM2 plug-in for monitoring the link quality of your wireless LAN cards"
HOMEPAGE="https://github.com/tecknicaltom/gkrellm-wifi"
SRC_URI="https://github.com/tecknicaltom/gkrellm-wifi/archive/${PV}.zip"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="x86 ppc amd64"
IUSE=""

RDEPEND=">=app-admin/gkrellm-2.1.12
		>=net-wireless/wireless-tools-22"
DEPEND="${RDEPEND}
		>=x11-libs/gtk+-2
		dev-util/pkgconfig"

src_compile() {
	CFLAGS="$CFLAGS -I/usr/include/"
	emake || die
}

src_install() {
	exeinto /usr/$(get_libdir)/gkrellm2/plugins
	doexe gkrellm-wifi.so
	dodoc AUTHORS COPYING ChangeLog INSTALL NEWS README THEMING TODO
}
