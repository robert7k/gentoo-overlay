# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Static photo gallery generator"
HOMEPAGE="http://www.thregr.org/~wavexx/software/fgallery/"
SRC_URI="http://www.thregr.org/~wavexx/software/fgallery/releases/${P}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	media-gfx/imagemagick[tiff,jpeg,lcms]
	media-libs/exiftool
	app-arch/zip
	>=dev-lang/perl-5.14[perl_features_ithreads]
	dev-perl/JSON-XS"
RDEPEND="${DEPEND}"

src_compile() {
	true
}

src_install() {
	dodir /usr/share/${PN}
	insinto /usr/share/${PN}
	doins -r *
	dodoc README.html NEWS.html
	fperms a+x /usr/share/fgallery/fgallery
	dosym /usr/share/${PN}/${PN} /usr/bin/${PN}
}
