# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI="4"
inherit eutils versionator

SLOT="$(get_major_version)"
RDEPEND=">=virtual/jdk-1.7"

RESTRICT="strip mirror"
QA_TEXTRELS="opt/${P}/bin/libbreakgen.so"

DESCRIPTION="IntelliJ IDEA is an intelligent Java IDE"
HOMEPAGE="https://jetbrains.com/idea/"

VER=($(get_all_version_components))
if [[ "${VER[4]}" == "0" ]]; then
    #if [[ "${VER[2]}" == "0" ]]; then
    #    SRC_URI="http://download.jetbrains.com/${PN}/${PN}IU-$(get_version_component_range 1-1).tar.gz"
    #else
        SRC_URI="http://download.jetbrains.com/${PN}/${PN}IU-$(get_version_component_range 1-2).tar.gz"
    #fi
else
    SRC_URI="http://download.jetbrains.com/${PN}/${PN}IU-$(get_version_component_range 1-3).tar.gz"
fi

LICENSE="IntelliJ-IDEA"
IUSE=""
KEYWORDS="~x86 ~amd64"
MY_PV="$(get_version_component_range 4-5)"
SHORT_PV="$(get_version_component_range 1-2)"

S="${WORKDIR}/${PN}-IU-${MY_PV}"

src_unpack() {
    unpack ${A}
    mv ${WORKDIR}/${PN}-IU-* ${WORKDIR}/${PN}-IU-${MY_PV}
}

src_prepare() {
	epatch ${FILESDIR}/idea-${SLOT}.sh.patch || die
}

src_install() {
	local dir="/opt/${P}"
	local exe="${PN}-${SLOT}"

	newconfd "${FILESDIR}/config-${SLOT}" idea-${SLOT}

	# config files
	insinto "/etc/idea"

	mv bin/idea.properties bin/idea-${SLOT}.properties
	doins bin/idea-${SLOT}.properties
	rm bin/idea-${SLOT}.properties

	case $ARCH in
		amd64|ppc64)
			cat bin/idea64.vmoptions > bin/idea.vmoptions
			rm bin/idea64.vmoptions
			;;
	esac

	mv bin/idea.vmoptions bin/idea-${SLOT}.vmoptions
	doins bin/idea-${SLOT}.vmoptions
	rm bin/idea-${SLOT}.vmoptions

	ln -s /etc/idea/idea-${SLOT}.properties bin/idea.properties

	# idea itself
	insinto "${dir}"
	doins -r *

	fperms 755 "${dir}/bin/${PN}.sh"
	fperms 755 "${dir}/bin/fsnotifier"
	fperms 755 "${dir}/bin/fsnotifier64"

	newicon "bin/${PN}.png" "${exe}.png"
	make_wrapper "${exe}" "/opt/${P}/bin/${PN}.sh"
	make_desktop_entry ${exe} "IntelliJ IDEA ${SHORT_PV}" "${exe}" "Development;IDE"

	# Protect idea conf on upgrade
	env_file="${T}/25idea-${SLOT}"
	echo "CONFIG_PROTECT=\"\${CONFIG_PROTECT} /etc/idea/conf\"" > "${env_file}"  || die
	doenvd "${env_file}"
}
