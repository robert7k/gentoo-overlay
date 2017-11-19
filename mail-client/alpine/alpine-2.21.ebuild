# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils flag-o-matic autotools multilib toolchain-funcs

DESCRIPTION="alpine is an easy to use text-based based mail and news client"
HOMEPAGE="http://www.washington.edu/alpine/ http://alpine.freeiz.com/alpine/ http://repo.or.cz/alpine.git/"
SRC_URI="http://alpine.freeiz.com/alpine/release/src/${P}.tar.xz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc ipv6 kerberos ldap libressl nls onlyalpine passfile smime spell ssl threads"

DEPEND="virtual/pam
	>=net-libs/c-client-2007f-r4
	>=sys-libs/ncurses-5.1:0=
	ssl? (
		!libressl? ( dev-libs/openssl:0= )
		libressl? ( dev-libs/libressl:0= )
	)
	ldap? ( net-nds/openldap )
	kerberos? ( app-crypt/mit-krb5 )
	spell? ( app-text/aspell )
"
RDEPEND="${DEPEND}
	app-misc/mime-types
	!<=net-mail/uw-imap-2004g"

src_prepare() {
	default
	mv "${WORKDIR}/alpine-59678f8" "${WORKDIR}/${P}"
	eautoreconf
}

src_configure() {
	local myconf="--without-tcl
		--with-system-pinerc=/etc/pine.conf
		--with-system-fixed-pinerc=/etc/pine.conf.fixed"
		#--disable-debug"
		# fixme
		#   --with-system-mail-directory=DIR?

	if use ssl; then
		myconf+=" --with-ssl
			--with-ssl-include-dir=/usr/include/openssl
			--with-ssl-lib-dir=/usr/$(get_libdir)
			--with-ssl-certs-dir=/etc/ssl/certs"
	else
		myconf+="--without-ssl"
	fi
	econf \
		$(use_with ldap) \
		$(use_with ssl) \
		$(use_with passfile passfile .pinepwd) \
		$(use_with kerberos krb5) \
		$(use_with threads pthread) \
		$(use_with spell interactive-spellcheck /usr/bin/aspell) \
		$(use_enable nls) \
		$(use_with ipv6) \
		$(use_with smime) \
		${myconf}
}

src_compile() {
	emake AR=$(tc-getAR)
}

src_install() {
	if use onlyalpine ; then
		dobin alpine/alpine
		doman doc/alpine.1
	else
		emake DESTDIR="${D}" install
		doman doc/man1/*.1
	fi

	dodoc NOTICE README*

	if use doc ; then
		dodoc doc/brochure.txt

		docinto html/tech-notes
		dohtml -r doc/tech-notes/
	fi
}
