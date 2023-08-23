# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop eutils java-pkg-2

SLOT="$(ver_cut 1-2)"
RDEPEND="
	dev-util/lldb:=
	sys-apps/util-linux
	sys-libs/libselinux
	sys-libs/libxcrypt:=
	sys-libs/pam
	sys-process/audit"

RESTRICT="strip mirror"
QA_TEXTRELS="opt/${P}/bin/libbreakgen.so"

DESCRIPTION="IntelliJ IDEA is an intelligent Java IDE"
HOMEPAGE="https://jetbrains.com/idea/"

SRC_URI="https://download.jetbrains.com/${PN}/${PN}IU-${PV}.tar.gz"

LICENSE="IntelliJ-IDEA"
IUSE=""
KEYWORDS="~x86 ~amd64"

PATCHES="${FILESDIR}/idea-${SLOT}.sh.patch"

S="${WORKDIR}/${PN}-IU-${PV}"

src_unpack() {
	unpack ${A}
	mv ${WORKDIR}/${PN}-IU-* ${WORKDIR}/${PN}-IU-${PV}
}

src_prepare() {
	default

	# See https://bugs.gentoo.org/780585
	java-pkg-2_src_prepare
}

src_compile() {
	true
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

	fperms 755 "${dir}/bin/repair"
	fperms 755 "${dir}/bin/ltedit.sh"
	fperms 755 "${dir}/bin/idea.sh"
	fperms 755 "${dir}/bin/fsnotifier"
	fperms 755 "${dir}/bin/inspect.sh"
	fperms 755 "${dir}/bin/restart.py"
	fperms 755 "${dir}/bin/remote-dev-server.sh"
	fperms 755 "${dir}/bin/format.sh"

	fperms -R 755 "${dir}/jbr/bin/"
	fperms -R 755 "${dir}/jbr/lib/chrome-sandbox"
	fperms -R 755 "${dir}/jbr/lib/jcef_helper"
	fperms -R 755 "${dir}/jbr/lib/jexec"
	fperms -R 755 "${dir}/jbr/lib/jspawnhelper"

	newicon "bin/${PN}.png" "${exe}.png"
	make_wrapper "${exe}" "/opt/${P}/bin/${PN}.sh"
	make_desktop_entry ${exe} "IntelliJ IDEA ${PV}" "${exe}" "Development;IDE"

	# Protect idea conf on upgrade
	env_file="${T}/25idea-${SLOT}"
	echo "CONFIG_PROTECT=\"\${CONFIG_PROTECT} /etc/idea/conf\"" > "${env_file}"  || die
	doenvd "${env_file}"
}

