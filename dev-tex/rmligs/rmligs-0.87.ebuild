# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Removes incorrectly used ligatures from LaTeX documents"
HOMEPAGE="https://ctan.org/tex-archive/support/rmligs"
SRC_URI="http://mirrors.ctan.org/support/rmligs/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-lang/perl"
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin ${PN} 
	dodoc README Changes BUGS
}
