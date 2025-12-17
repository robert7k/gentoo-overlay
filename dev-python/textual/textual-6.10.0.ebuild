# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..13} )

DOCS_BUILDER="mkdocs"
DOCS_DEPEND="
	dev-python/mkdocstrings
	dev-python/mkdocstrings-python
	dev-python/mkdocs-exclude
	dev-python/mkdocs-git-revision-date-localized-plugin
	dev-python/mkdocs-material
	dev-python/mkdocs-rss-plugin
"
DOCS_INITIALIZE_GIT=1

inherit distutils-r1 optfeature docs

DESCRIPTION="Modern Text User Interface framework"
HOMEPAGE="https://github.com/Textualize/textual https://pypi.org/project/textual/"
SRC_URI="https://github.com/Textualize/textual/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/markdown-it-py-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-3.6.0[${PYTHON_USEDEP}]
	<dev-python/platformdirs-5[${PYTHON_USEDEP}]
	>=dev-python/rich-14.2.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.4.0[${PYTHON_USEDEP}]
	<dev-python/typing-extensions-5[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

DOCS+=( CHANGELOG.md LICENSE README.md )

RESTRICT="test"

python_compile_all() {
	echo "INHERIT: mkdocs-offline.yml" > "${S}/mkdocs.yml"
	grep -v "\- \"*[Bb]log" "${S}/mkdocs-nav.yml" >> "${S}/mkdocs.yml"
	if use doc; then
		DOCS+=( questions )
	fi
	docs_compile
	rm "${S}/mkdocs.yml"
}

pkg_postinst() {
	optfeature "bindings for python" dev-python/tree-sitter
}
