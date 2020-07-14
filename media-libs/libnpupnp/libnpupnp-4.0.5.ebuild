EAPI=7

DESCRIPTION="UPnP library derived from the venerable pupnp"
HOMEPAGE="http://www.lesbonscomptes.com/upplay/downloads.html"
SRC_URI="http://www.lesbonscomptes.com/upmpdcli/downloads/${PN}-${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""


DEPEND="net-libs/libmicrohttpd
	net-misc/curl"
RDEPEND="${DEPEND}"

src_install() {
	emake DESTDIR="${D}" install

}
