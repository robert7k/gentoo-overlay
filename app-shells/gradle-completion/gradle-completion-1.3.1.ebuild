# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit bash-completion-r1

DESCRIPTION="Bash completions for Gradle"
HOMEPAGE="https://github.com/gradle/gradle-completion"
SRC_URI="https://github.com/gradle/${PN}/archive/v${PV}.zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=app-shells/bash-completion-1.2"

src_install() {
	dodoc README.md

	newbashcomp gradle-completion.bash gradle
	bashcomp_alias gradle gradlew
}
