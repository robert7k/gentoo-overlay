# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $


EAPI=5

DESCRIPTION="A C++ wrapper for libupnp - used with upmpdcli or upplay"
HOMEPAGE="http://www.lesbonscomptes.com/upplay/downloads.html"
SRC_URI="http://www.lesbonscomptes.com/upmpdcli/downloads/${PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""


DEPEND="net-libs/libupnp"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install

}
