# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Offers FRITZ!Box related core functionality."
HOMEPAGE="https://gitlab.com/tabos/librm"

COMMIT="9dabfe11507af5c72fb08c8fa582108122d42fd4"
SRC_URI="https://gitlab.com/tabos/librm/-/archive/${COMMIT}/librm-${COMMIT}.tar.bz2 -> ${P}.tar.bz2"
S="${WORKDIR}/librm-${COMMIT}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	app-crypt/libsecret
	dev-libs/glib:2
	x11-libs/gdk-pixbuf:2
	net-libs/libsoup:3.0
	media-libs/speex
	dev-libs/libxml2:2
	>=media-libs/tiff-4.1.0
	media-libs/spandsp
	dev-libs/json-glib
	media-libs/libsndfile
	net-libs/gssdp
	net-libs/gupnp:1.6
	net-libs/libcapi
	media-libs/gstreamer:1.0
	media-libs/gst-plugins-base:1.0"
DEPEND="${RDEPEND}"
