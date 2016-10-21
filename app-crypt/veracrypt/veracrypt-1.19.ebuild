# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"

inherit flag-o-matic linux-info multilib toolchain-funcs wxwidgets eutils pax-utils

DESCRIPTION="VeraCrypt is a free disk encryption software based on TrueCrypt"
HOMEPAGE="https://veracrypt.codeplex.com"
SRC_URI="https://github.com/veracrypt/VeraCrypt/archive/VeraCrypt_${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0 truecrypt-3.0"
SLOT="0"
KEYWORDS="~*"
IUSE="X +asm"
RESTRICT="mirror bindist"

RDEPEND=">=sys-fs/lvm2-2.02.45
	sys-fs/fuse
	x11-libs/wxGTK:3.0[X?]
	app-arch/makeself
	app-admin/sudo"
DEPEND="${RDEPEND}
	!ppc? ( dev-lang/nasm )"

S="${WORKDIR}/VeraCrypt-VeraCrypt_${PV}/src"

pkg_setup() {
	local CONFIG_CHECK="~BLK_DEV_DM ~DM_CRYPT ~FUSE_FS ~CRYPTO ~CRYPTO_XTS"
	linux-info_pkg_setup

	local WX_GTK_VER="3.0"
	if use X; then
		need-wxwidgets unicode
	else
		need-wxwidgets base-unicode
	fi
}

src_prepare() {
	if has_version x11-libs/wxGTK[X]; then
		# Fix linking when NOGUI=1
		sed -e "s/WX_CONFIG_LIBS := base/&,core/" -i Main/Main.make || die "sed Main/Main.make failed"
	fi

	epatch "${FILESDIR}/makefile-archdetect.diff"
}

src_compile() {
	local EXTRA

	use X || EXTRA+=" NOGUI=1"
	use asm  || EXTRA+=" NOASM=1"
	append-flags -DCKR_NEW_PIN_MODE=0x000001B0 -DCKR_NEXT_OTP=0x000001B1

	emake \
		${EXTRA} \
		NOSTRIP=1 \
		NOTEST=1 \
		VERBOSE=1 \
		CC="$(tc-getCC)" \
		CXX="$(tc-getCXX)" \
		AR="$(tc-getAR)" \
		RANLIB="$(tc-getRANLIB)" \
		TC_EXTRA_CFLAGS="${CFLAGS}" \
		TC_EXTRA_CXXFLAGS="${CXXFLAGS}" \
		TC_EXTRA_LFLAGS="${LDFLAGS}" \
		WX_CONFIG="${WX_CONFIG}"
		#PKCS11_INC="${T}/pkcs11/"
}

src_test() {
	"${S}/Main/veracrypt" --text --test || die "tests failed"
}

src_install() {
	dobin Main/veracrypt
	dodoc Readme.txt
	if use X; then
		newicon Resources/Icons/VeraCrypt-48x48.xpm veracrypt.xpm
		make_desktop_entry ${PN} "VeraCrypt" ${PN} "System"
	fi

	pax-mark -m "${D}/usr/bin/veracrypt"
}

pkg_postinst() {
	ewarn "If you're getting errors about DISPLAY while using the terminal"
	ewarn "it's a known upstream bug. To use VeraCrypt from the terminal"
	ewarn "all that's necessary is to run: unset DISPLAY"
	ewarn "This will make the display unaccessable from that terminal "
	ewarn "but at least you will be able to access your volumes."
	ewarn

	ewarn "VeraCrypt has a very restrictive license. Please be explicitly aware"
	ewarn "of the limitations on redistribution of binaries or modified source."
}
