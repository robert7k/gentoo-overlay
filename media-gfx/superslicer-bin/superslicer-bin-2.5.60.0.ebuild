# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg

TAG="240702"
DESCRIPTION="SuperSlicer gcode generator for 3D printers"
HOMEPAGE="https://github.com/supermerill/SuperSlicer/"
SRC_URI="https://github.com/supermerill/SuperSlicer/releases/download/${PV}/SuperSlicer_${PV}_linux64_${TAG}.tar.zip"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="mirror"

BDEPEND="
    app-arch/unzip
    dev-util/patchelf"
RDEPEND="
	dev-libs/glib:2
	media-libs/libglvnd
	sys-apps/dbus
	sys-libs/zlib
	x11-libs/cairo
	x11-libs/gdk-pixbuf:2
	x11-libs/gtk+:3
	x11-libs/libX11
	x11-libs/pango"

QA_PREBUILT="opt/superslicer/bin/superslicer"

src_unpack() {
    default
    mkdir "$P"
	tar -xf "SuperSlicer_${PV}_linux64_${TAG}.tar" -C "./$P"
	rm "SuperSlicer_${PV}_linux64_${TAG}.tar"
}

src_install() {
    mkdir -p "${ED}/opt/superslicer"
    insinto "/opt/superslicer"
    doins -r *

    fperms +x "/opt/superslicer/bin/superslicer"
    fperms +x "/opt/superslicer/superslicer"

    patchelf --set-rpath '$ORIGIN/../lib' "${ED}/opt/superslicer/bin/superslicer" || die "Failed to set RPATH"

	make_desktop_entry /opt/superslicer/bin/superslicer \
	   "SuperSlicer" \
		/opt/superslicer/resources/icons/SuperSlicer_192px.png \
		"Graphics" \
		"MimeType=model/stl;application/vnd.ms-3mfdocument;application/prs.wavefront-obj;application/x-amf;"
}
