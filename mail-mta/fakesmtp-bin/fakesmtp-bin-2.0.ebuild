# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop eutils java-pkg-2

DESCRIPTION="Fake SMTP Server with GUI for testing emails in applications easily."
HOMEPAGE="http://nilhcem.github.io/FakeSMTP/"
SRC_URI="http://nilhcem.github.com/FakeSMTP/downloads/fakeSMTP-latest.zip -> ${P}.zip"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"

DEPEND=">=virtual/jre-1.6.0"
RDEPEND=">=virtual/jre-1.6.0"

S="${WORKDIR}"
MY_PN="fakesmtp"

src_compile() {
	true
}

src_install() {
	java-pkg_newjar ${S}/fakeSMTP-2.0.jar "${MY_PN}.jar" || die "java-pkg_newjar faild"
	java-pkg_dolauncher ${MY_PN} --jar "${MY_PN}.jar" --pkg_args '-s -p 2525 -o /tmp/fakeSmtp-received-mails' || die "java-pkg_dolauncher failed"
	doicon ${FILESDIR}/${MY_PN}.png
	make_desktop_entry ${MY_PN} "FakeSMTP" ${MY_PN} "Development"
}
