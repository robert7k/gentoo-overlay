# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
inherit eutils unpacker

SLOT="0"
DESCRIPTION="Slack team communication desktop client"
HOMEPAGE="https://slack.com/"
BASE_URI="https://downloads.slack-edge.com/linux_releases"
BASE_NAME="slack-desktop-${PV}"
SRC_URI="
        amd64? ( ${BASE_URI}/${BASE_NAME}-amd64.deb )
"

LICENSE=""
KEYWORDS="-* ~amd64"

RESTRICT="mirror"

DEPEND="
    gnome-base/gconf:2
    x11-libs/gtk+:2
    virtual/libudev
    dev-libs/libgcrypt
    x11-libs/libnotify
    x11-libs/libXtst
    dev-libs/nss
    dev-lang/python
    gnome-base/gvfs
    x11-misc/xdg-utils
    net-print/cups
    gnome-base/libgnome-keyring
    "

S="${WORKDIR}"

src_unpack() {
    unpack_deb "${A}"
}

src_install() {
    cp -R "${WORKDIR}/usr" "${D}" || die "install failed!" 
}
