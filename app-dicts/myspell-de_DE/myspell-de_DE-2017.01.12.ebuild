# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="7"

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

MY_PV=$(ver_rs 1- -)	# YYYY-MM-DD

DESCRIPTION="German dictionaries for myspell/hunspell"
HOMEPAGE="
	https://extensions.libreoffice.org/extensions/german-de-de-frami-dictionaries
"
SRC_URI="
	https://extensions.libreoffice.org/extensions/german-de-de-frami-dictionaries/${MY_PV}/@@download/file/dict-de_DE-frami_${MY_PV}.oxt
"

LICENSE="GPL-3 GPL-2 LGPL-3+"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~hppa ~ia64 ~mips ~ppc ~ppc64 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd"

src_prepare() {
	# rename the tarballs
	for i in *_frami.*; do
		mv "${i}" "${i/_frami}" || die
	done

	default
}
