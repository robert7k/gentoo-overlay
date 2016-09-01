# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

MYSPELL_DICT=(
	"de_DE.aff"
	"de_DE.dic"
)

MYSPELL_HYPH=(
	"hyph_de_DE.dic"
)

MYSPELL_THES=(
	"th_de_DE_v2.dat"
	"th_de_DE_v2.idx"
)

inherit myspell-r2

DESCRIPTION="German dictionaries for myspell/hunspell"
HOMEPAGE="
	http://extensions.libreoffice.org/extension-center/german-de-de-frami-dictionaries
"
SRC_URI="
	http://extensions.libreoffice.org/extension-center/german-de-de-frami-dictionaries/releases/${PV}/dict-de_de-frami_${PV//./-}.oxt
"

LICENSE="GPL-2 LGPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""

src_prepare() {
	# rename the tarballs
	for i in *_frami.*; do
		mv "${i}" "${i/_frami}" || die
	done
}
