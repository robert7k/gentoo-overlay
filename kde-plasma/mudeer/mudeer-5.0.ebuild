# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="KDE Plasma Screen Splitting Shortcuts ideal for Ultrawide Monitors"
HOMEPAGE="https://github.com/darkstego/Mudeer"
SRC_URI="https://github.com/darkstego/Mudeer/archive/refs/tags/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

BDEPEND="kde-frameworks/kpackage:6"
RDEPEND="kde-plasma/kwin:6"

S="${WORKDIR}/Mudeer-${PV}"

src_build() {
	true
}

src_install() {
	insinto /usr/share/kwin/scripts/mudeer
	doins -r "${S}/package/metadata.json"
	doins -r "${S}/package/contents"
}
