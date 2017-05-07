# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

ASPELL_LANG="German and Swiss-German"
ASPELL_VERSION=6

inherit aspell-dict-r1

MY_P=aspell6-de-20030222-1

SRC_URI="mirror://gnu/aspell/dict/de/${MY_P}.tar.bz2"

LICENSE="GPL-2"
KEYWORDS="alpha amd64 arm ~arm64 hppa ia64 m68k ~mips ppc ppc64 s390 sh sparc x86 ~amd64-fbsd ~sparc-fbsd ~x86-fbsd ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos"
IUSE="linguas_de_DE linguas_de_AT linguas_de_CH"

S=${WORKDIR}/${MY_P}

src_install() {
   make DESTDIR="${D}" install || die

   for doc in README info ; do
	   [ -s "$doc" ] && dodoc $doc
   done

	if ! use linguas_de_DE ; then
		rm ${D}usr/lib64/aspell-0.60/de_DE* || die
	fi
	if ! use linguas_de_AT ; then
		rm ${D}usr/lib64/aspell-0.60/de_AT* || die
	fi
	if ! use linguas_de_CH ; then
		rm ${D}usr/lib64/aspell-0.60/de_CH* || die
		rm ${D}usr/lib64/aspell-0.60/swiss* || die
	fi
}
