# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Lightweight distributed issue tracker for AI coding agents"
HOMEPAGE="https://github.com/steveyegge/beads"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-vcs/git
	dev-db/sqlite
"

EGO_SUM=(
	"github.com/anthropics/anthropic-sdk-go v1.18.1"
	"github.com/anthropics/anthropic-sdk-go v1.18.1/go.mod"
	"github.com/cpuguy83/go-md2man/v2 v2.0.6/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/fatih/color v1.18.0"
	"github.com/fatih/color v1.18.0/go.mod"
	"github.com/frankban/quicktest v1.14.6"
	"github.com/frankban/quicktest v1.14.6/go.mod"
	"github.com/fsnotify/fsnotify v1.9.0"
	"github.com/fsnotify/fsnotify v1.9.0/go.mod"
	"github.com/go-viper/mapstructure/v2 v2.4.0"
	"github.com/go-viper/mapstructure/v2 v2.4.0/go.mod"
	"github.com/google/go-cmp v0.7.0"
	"github.com/google/go-cmp v0.7.0/go.mod"
	"github.com/inconshreveable/mousetrap v1.1.0"
	"github.com/inconshreveable/mousetrap v1.1.0/go.mod"
	"github.com/kr/pretty v0.3.1"
	"github.com/kr/pretty v0.3.1/go.mod"
	"github.com/kr/text v0.2.0"
	"github.com/kr/text v0.2.0/go.mod"
	"github.com/mattn/go-colorable v0.1.13"
	"github.com/mattn/go-colorable v0.1.13/go.mod"
	"github.com/mattn/go-isatty v0.0.16/go.mod"
	"github.com/mattn/go-isatty v0.0.20"
	"github.com/mattn/go-isatty v0.0.20/go.mod"
	"github.com/ncruces/go-sqlite3 v0.30.1"
	"github.com/ncruces/go-sqlite3 v0.30.1/go.mod"
	"github.com/ncruces/julianday v1.0.0"
	"github.com/ncruces/julianday v1.0.0/go.mod"
	"github.com/pelletier/go-toml/v2 v2.2.4"
	"github.com/pelletier/go-toml/v2 v2.2.4/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/rogpeppe/go-internal v1.9.0"
	"github.com/rogpeppe/go-internal v1.9.0/go.mod"
	"github.com/russross/blackfriday/v2 v2.1.0/go.mod"
	"github.com/sagikazarmark/locafero v0.11.0"
	"github.com/sagikazarmark/locafero v0.11.0/go.mod"
	"github.com/sourcegraph/conc v0.3.1-0.20240121214520-5f936abd7ae8"
	"github.com/sourcegraph/conc v0.3.1-0.20240121214520-5f936abd7ae8/go.mod"
	"github.com/spf13/afero v1.15.0"
	"github.com/spf13/afero v1.15.0/go.mod"
	"github.com/spf13/cast v1.10.0"
	"github.com/spf13/cast v1.10.0/go.mod"
	"github.com/spf13/cobra v1.10.1"
	"github.com/spf13/cobra v1.10.1/go.mod"
	"github.com/spf13/pflag v1.0.9/go.mod"
	"github.com/spf13/pflag v1.0.10"
	"github.com/spf13/pflag v1.0.10/go.mod"
	"github.com/spf13/viper v1.21.0"
	"github.com/spf13/viper v1.21.0/go.mod"
	"github.com/stretchr/testify v1.11.1"
	"github.com/stretchr/testify v1.11.1/go.mod"
	"github.com/subosito/gotenv v1.6.0"
	"github.com/subosito/gotenv v1.6.0/go.mod"
	"github.com/tetratelabs/wazero v1.10.1"
	"github.com/tetratelabs/wazero v1.10.1/go.mod"
	"github.com/tidwall/gjson v1.14.2/go.mod"
	"github.com/tidwall/gjson v1.18.0"
	"github.com/tidwall/gjson v1.18.0/go.mod"
	"github.com/tidwall/match v1.1.1"
	"github.com/tidwall/match v1.1.1/go.mod"
	"github.com/tidwall/pretty v1.2.0/go.mod"
	"github.com/tidwall/pretty v1.2.1"
	"github.com/tidwall/pretty v1.2.1/go.mod"
	"github.com/tidwall/sjson v1.2.5"
	"github.com/tidwall/sjson v1.2.5/go.mod"
	"go.yaml.in/yaml/v3 v3.0.4"
	"go.yaml.in/yaml/v3 v3.0.4/go.mod"
	"golang.org/x/mod v0.30.0"
	"golang.org/x/mod v0.30.0/go.mod"
	"golang.org/x/sys v0.0.0-20220811171246-fbc7d0a398ab/go.mod"
	"golang.org/x/sys v0.6.0/go.mod"
	"golang.org/x/sys v0.38.0"
	"golang.org/x/sys v0.38.0/go.mod"
	"golang.org/x/term v0.37.0"
	"golang.org/x/term v0.37.0/go.mod"
	"golang.org/x/text v0.30.0"
	"golang.org/x/text v0.30.0/go.mod"
	"golang.org/x/tools v0.38.0"
	"golang.org/x/tools v0.38.0/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15"
	"gopkg.in/check.v1 v1.0.0-20190902080502-41f04d3bba15/go.mod"
	"gopkg.in/natefinch/lumberjack.v2 v2.2.1"
	"gopkg.in/natefinch/lumberjack.v2 v2.2.1/go.mod"
	"gopkg.in/yaml.v3 v3.0.1"
	"gopkg.in/yaml.v3 v3.0.1/go.mod"
	"rsc.io/script v0.0.2"
	"rsc.io/script v0.0.2/go.mod"
)

go-module_set_globals

SRC_URI="https://github.com/steveyegge/beads/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

src_compile() {
	ego build -o bd ./cmd/bd
}

src_install() {
	dobin bd

	dodoc README.md
}
