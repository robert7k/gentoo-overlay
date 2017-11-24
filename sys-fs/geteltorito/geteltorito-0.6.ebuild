# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Perl script which to extract El Torito boot images"
HOMEPAGE="http://userpages.uni-koblenz.de/~krienke/ftp/noarch/geteltorito/"
SRC_URI="http://userpages.uni-koblenz.de/~krienke/ftp/noarch/geteltorito/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RESTRICT="mirror"

DEPEND=""
RDEPEND="dev-lang/perl"

S="${WORKDIR}/${PN}"

src_install() {
	dobin ${PN}
	dodoc README
}
