# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

ASPELL_LANG="English (US, British, Canadian)"
ASPELL_VERSION=6

inherit aspell-dict-r1 versionator

SRC_URI="mirror://gnu/aspell/dict/${ASPELL_SPELLANG}/${PN%-*}${ASPELL_VERSION}-${PN#*-}-$(replace_version_separator 3 '-').tar.bz2"

LICENSE="myspell-en_CA-KevinAtkinson public-domain Princeton Ispell"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~sparc-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~x86-solaris"
IUSE="linguas_en_CA linguas_en_GB linguas_en_AU linguas_en_US"

src_install() {
   make DESTDIR="${D}" install || die

	if ! use linguas_en_US ; then
		rm ${D}usr/lib64/aspell-0.60/en_US* || die
		rm ${D}usr/lib64/aspell-0.60/american* || die
	fi
	if ! use linguas_en_CA ; then
		rm ${D}usr/lib64/aspell-0.60/en_CA* || die
		rm ${D}usr/lib64/aspell-0.60/canadian* || die
	fi
	if ! use linguas_en_GB ; then
		rm ${D}usr/lib64/aspell-0.60/en_GB* || die
		rm ${D}usr/lib64/aspell-0.60/british* || die
	fi
	if ! use linguas_en_AU ; then
		rm ${D}usr/lib64/aspell-0.60/en_AU* || die
		rm ${D}usr/lib64/aspell-0.60/australian* || die
	fi
}
