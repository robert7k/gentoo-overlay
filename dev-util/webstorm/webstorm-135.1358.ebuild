# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit user eutils

DESCRIPTION="WebStorm is a lightweight yet powerful IDE, perfectly equipped for complex client-side development and server-side development with Node.js."
HOMEPAGE="https://www.jetbrains.com/webstorm"
SRC_URI="http://download.jetbrains.com/webstorm/WebStorm-8.0.6.tar.gz"

LICENSE=""
SLOT="8"
KEYWORDS="x86 amd64"
IUSE=""

DEPEND=">=virtual/jre-1.6"
RDEPEND="${DEPEND}"

FOLDER="webstorm-${SLOT}"
PROGNAME="WebStorm ${SLOT}"

S="${WORKDIR}"

pkg_setup() {
	enewgroup webstorm
}

src_install() {
	dodir /opt/${FOLDER}

	cd WebStorm-*/
	insinto /opt/${FOLDER}
	doins -r *

	fowners -R :webstorm /opt/${FOLDER}/
	fperms -R g+w /opt/${FOLDER}/

	fperms a+x /opt/${FOLDER}/bin/webstorm.sh || die "chmod webstorm.sh failed"
	fperms a+x /opt/${FOLDER}/bin/fsnotifier || die "chmod fsnotifier failed"
	fperms a+x /opt/${FOLDER}/bin/fsnotifier64 || die "chmod fsnotifier64 failed"

	make_wrapper ${FOLDER} /opt/${FOLDER}/bin/webstorm.sh

	mv "bin/webide.png" "bin/${FOLDER}.png"
	doicon "bin/${FOLDER}.png"
	make_desktop_entry ${FOLDER} "${PROGNAME}" "${FOLDER}"
}

pkg_postinst() {
	elog
	elog "Users in the 'webstorm' group will be able to update the IDE with it's auto updater."
	elog
}
