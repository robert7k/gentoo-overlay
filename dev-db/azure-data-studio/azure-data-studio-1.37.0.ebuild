# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop

DESCRIPTION="Azure Data Studio is a cross-platform database tool for data professionals"
HOMEPAGE="https://docs.microsoft.com/en-us/sql/azure-data-studio/download-azure-data-studio https://github.com/microsoft/azuredatastudio"
SRC_URI="https://azuredatastudio-update.azurewebsites.net/1.37.0/linux-x64/stable -> ${P}.tar.gz"

LICENSE="ms-source-eula"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-util/lttng-ust"
RDEPEND="${DEPEND}"
BDEPEND=""

RESTRICT="strip mirror"

S="${WORKDIR}/azuredatastudio-linux-x64"

QA_PREBUILT="opt/azure-data-studio/azuredatastudio
	opt/azure-data-studio/chrome-sandbox
	opt/azure-data-studio/libEGL.so
	opt/azure-data-studio/libGLESv2.so
	opt/azure-data-studio/libffmpeg.so
	opt/azure-data-studio/libvk_swiftshader.so
	opt/azure-data-studio/libvulkan.so.1
	opt/azure-data-studio/resources/app/extensions/big-data-cluster/node_modules/@microsoft/ads-kerberos/build/Release/kerberos.node
	opt/azure-data-studio/resources/app/extensions/mssql/node_modules/@microsoft/ads-kerberos/build/Release/kerberos.node
	opt/azure-data-studio/resources/app/extensions/mssql/sqltoolsservice/Linux/4.0.1.1/MicrosoftKustoServiceLayer
	opt/azure-data-studio/resources/app/extensions/mssql/sqltoolsservice/Linux/4.0.1.1/MicrosoftSqlToolsCredentials
	opt/azure-data-studio/resources/app/extensions/mssql/sqltoolsservice/Linux/4.0.1.1/MicrosoftSqlToolsServiceLayer
	opt/azure-data-studio/resources/app/extensions/mssql/sqltoolsservice/Linux/4.0.1.1/SqlToolsResourceProviderService
	opt/azure-data-studio/resources/app/extensions/mssql/sqltoolsservice/Linux/4.0.1.1/System.IO.Compression.Native.so
	opt/azure-data-studio/resources/app/extensions/mssql/sqltoolsservice/Linux/4.0.1.1/System.Native.so
	opt/azure-data-studio/resources/app/extensions/mssql/sqltoolsservice/Linux/4.0.1.1/System.Net.Http.Native.so
	opt/azure-data-studio/resources/app/extensions/mssql/sqltoolsservice/Linux/4.0.1.1/System.Security.Cryptography.Native.OpenSsl.so
	opt/azure-data-studio/resources/app/extensions/mssql/sqltoolsservice/Linux/4.0.1.1/createdump
	opt/azure-data-studio/resources/app/extensions/mssql/sqltoolsservice/Linux/4.0.1.1/libSystem.Globalization.Native.so
	opt/azure-data-studio/resources/app/extensions/mssql/sqltoolsservice/Linux/4.0.1.1/libSystem.IO.Compression.Native.so
	opt/azure-data-studio/resources/app/extensions/mssql/sqltoolsservice/Linux/4.0.1.1/libSystem.Native.so
	opt/azure-data-studio/resources/app/extensions/mssql/sqltoolsservice/Linux/4.0.1.1/libSystem.Net.Security.Native.so
	opt/azure-data-studio/resources/app/extensions/mssql/sqltoolsservice/Linux/4.0.1.1/libSystem.Security.Cryptography.Native.OpenSsl.so
	opt/azure-data-studio/resources/app/extensions/mssql/sqltoolsservice/Linux/4.0.1.1/libclrjit.so
	opt/azure-data-studio/resources/app/extensions/mssql/sqltoolsservice/Linux/4.0.1.1/libcoreclr.so
	opt/azure-data-studio/resources/app/extensions/mssql/sqltoolsservice/Linux/4.0.1.1/libcoreclrtraceptprovider.so
	opt/azure-data-studio/resources/app/extensions/mssql/sqltoolsservice/Linux/4.0.1.1/libdbgshim.so
	opt/azure-data-studio/resources/app/extensions/mssql/sqltoolsservice/Linux/4.0.1.1/libhostfxr.so
	opt/azure-data-studio/resources/app/extensions/mssql/sqltoolsservice/Linux/4.0.1.1/libhostpolicy.so
	opt/azure-data-studio/resources/app/extensions/mssql/sqltoolsservice/Linux/4.0.1.1/libmscordaccore.so
	opt/azure-data-studio/resources/app/extensions/mssql/sqltoolsservice/Linux/4.0.1.1/libmscordbi.so
	opt/azure-data-studio/resources/app/node_modules.asar.unpacked/@vscode/sqlite3/build/Release/sqlite.node
	opt/azure-data-studio/resources/app/node_modules.asar.unpacked/keytar/build/Release/keytar.node
	opt/azure-data-studio/resources/app/node_modules.asar.unpacked/native-is-elevated/build/Release/iselevated.node
	opt/azure-data-studio/resources/app/node_modules.asar.unpacked/native-keymap/build/Release/keymapping.node
	opt/azure-data-studio/resources/app/node_modules.asar.unpacked/native-watchdog/build/Release/watchdog.node
	opt/azure-data-studio/resources/app/node_modules.asar.unpacked/node-pty/build/Release/pty.node
	opt/azure-data-studio/resources/app/node_modules.asar.unpacked/nsfw/build/Release/nsfw.node
	opt/azure-data-studio/resources/app/node_modules.asar.unpacked/spdlog/build/Release/spdlog.node
	opt/azure-data-studio/resources/app/node_modules.asar.unpacked/windows-foreground-love/build/Release/foreground_love.node
	opt/azure-data-studio/resources/app/node_modules.asar.unpacked/windows-foreground-love/build/Release/obj.target/foreground_love.node
	opt/azure-data-studio/swiftshader/libEGL.so
	opt/azure-data-studio/swiftshader/libGLESv2.so"

src_install() {
	insinto /opt/${PN}
	doins -r *

	exeinto /opt/${PN}
	doexe azuredatastudio
	dosym /opt/${PN}/azuredatastudio /usr/bin/azuredatastudio

	newicon -s 128 ${S}/resources/app/resources/linux/code.png azuredatastudio.png

	make_desktop_entry "azuredatastudio" "Azure Data Studio" "/usr/share/icons/hicolor/128x128/apps/azuredatastudio.png" "Development"
}
