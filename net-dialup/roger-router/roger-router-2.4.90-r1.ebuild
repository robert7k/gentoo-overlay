# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson gnome2-utils xdg-utils

DESCRIPTION="A graphical user interface for Fritz!Box routers."
HOMEPAGE="https://tabos.gitlab.io/projects/rogerrouter/"

inherit git-r3
EGIT_REPO_URI="https://gitlab.com/tabos/rogerrouter.git"
KEYWORDS="~amd64"

LICENSE="GPL-2"
SLOT="0"

RDEPEND="
	app-text/ghostscript-gpl:=
	app-text/libebook
	dev-libs/glib:2
	gui-libs/libhandy:1
	media-libs/tiff:=
	net-libs/libsoup:2.4
	dev-libs/libgdata
	net-libs/librm
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:3
	x11-libs/pango"
DEPEND="${RDEPEND}"

src_configure() {
	meson_src_configure
}

pkg_postinst() {
	gnome2_schemas_update
}

pkg_postrm() {
	gnome2_schemas_update
}
