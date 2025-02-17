# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_HANDBOOK="forceoptional"
ECM_TEST="true"
inherit ecm kde.org optfeature

DESCRIPTION="Advanced audio player based on KDE frameworks"
HOMEPAGE="https://amarok.kde.org/"
SRC_URI="https://invent.kde.org/multimedia/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="6"
KEYWORDS="~amd64"
IUSE="ipod lastfm mariadb mtp podcast wikipedia"

DEPEND="
	app-crypt/qca
	dev-qt/linguist-tools
	dev-qt/qtbase:6
	dev-qt/qtdeclarative:6
	dev-qt/qtsvg:6
	dev-qt/qttools:6

	kde-frameworks/extra-cmake-modules
	kde-frameworks/karchive:6
	kde-frameworks/kcmutils:6
	kde-frameworks/kcodecs:6
	kde-frameworks/kconfig:6
	kde-frameworks/kconfigwidgets:6
	kde-frameworks/kcoreaddons:6
	kde-frameworks/kcrash:6
	kde-frameworks/kdbusaddons:6
	kde-frameworks/kdnssd:6
	kde-frameworks/kdoctools:6
	kde-frameworks/kglobalaccel:6
	kde-frameworks/kguiaddons:6
	kde-frameworks/ki18n:6
	kde-frameworks/kiconthemes:6
	kde-frameworks/kio:6
	kde-frameworks/kirigami:6
	kde-frameworks/knewstuff:6
	kde-frameworks/knotifications:6
	kde-frameworks/kpackage:6
	kde-frameworks/kstatusnotifieritem:6
	kde-frameworks/ktexteditor:6
	kde-frameworks/kwidgetsaddons:6
	kde-frameworks/kwindowsystem:6
	kde-frameworks/solid:6
	kde-frameworks/threadweaver:6

	media-libs/taglib
	media-libs/phonon[qt6]
	sci-libs/fftw

	ipod? ( media-libs/libmygpo-qt )
	lastfm? ( >=media-libs/liblastfm-1.1.0_pre20150206 )
	mariadb? ( dev-db/mariadb-connector-c:= )
	!mariadb? ( dev-db/mysql-connector-c:= )
	mtp? ( media-libs/libmtp )
	podcast? ( media-libs/libmygpo-qt )
	wikipedia? ( dev-qt/qtwebengine:6 )
"
RDEPEND="${DEPEND}"

RDEPEND="${DEPEND}
	kde-frameworks/kirigami:6
	media-video/ffmpeg
"

S="${WORKDIR}/${PN}-v${PV}"

src_configure() {
	local mycmakeargs=(
		-DBUILD_WITH_QT6=ON
		-DWITH_MP3Tunes=OFF
		-DWITH_PLAYER=ON
		-DWITH_UTILITIES=ON
		-DCMAKE_DISABLE_FIND_PACKAGE_Googlemock=ON
		-DCMAKE_DISABLE_FIND_PACKAGE_LibOFA=ON
		-DCMAKE_DISABLE_FIND_PACKAGE_MySQLe=ON
		-DWITH_IPOD=$(usex ipod)
		-DWITH_GPODDER=OFF
		$(cmake_use_find_package lastfm LibLastFm)
		$(cmake_use_find_package !mariadb MySQL)
		$(cmake_use_find_package mtp Mtp)
		$(cmake_use_find_package podcast Mygpo-qt6)
		$(cmake_use_find_package wikipedia Qt6WebEngine)
	)

	use ipod && mycmakeargs+=( DWITH_GDKPixBuf=ON )

	ecm_src_configure
}

pkg_postinst() {
	ecm_pkg_postinst

	pkg_is_installed() {
		echo "${1} ($(has_version ${1} || echo "not ")installed)"
	}

	db_name() {
		use mariadb && echo "MariaDB" || echo "MySQL"
	}

	optfeature "Audio CD support" "kde-apps/audiocd-kio:6"

	if [[ -z ${REPLACING_VERSIONS} ]]; then
		elog "You must configure ${PN} to use an external database server."
		elog " 1. Make sure either MySQL or MariaDB is installed and configured"
		elog "    Checking local system:"
		elog "      $(pkg_is_installed dev-db/mariadb)"
		elog "      $(pkg_is_installed dev-db/mysql)"
		elog "    For preliminary configuration of $(db_name) Server refer to"
		elog "    https://wiki.gentoo.org/wiki/$(db_name)#Configuration"
		elog " 2. Ensure 'mysql' service is started and run:"
		elog "    # emerge --config amarok"
		elog " 3. Run ${PN} and go to 'Configure Amarok - Database' menu page"
		elog "    Check 'Use external MySQL database' and press OK"
		elog
		elog "For more information please read:"
		elog "  https://community.kde.org/Amarok/Community/MySQL"
	fi
}

pkg_config() {
	# Create external mysql database with amarok default user/password
	local AMAROK_DB_NAME="amarokdb"
	local AMAROK_DB_USER_NAME="amarokuser"
	local AMAROK_DB_USER_PWD="password"

	einfo "Initializing ${PN} MySQL database 'amarokdb':"
	einfo "If prompted for a password, please enter your MySQL root password."
	einfo

	if [[ -e "${EROOT}"/usr/bin/mysql ]]; then
		"${EROOT}"/usr/bin/mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS ${AMAROK_DB_NAME}; GRANT ALL PRIVILEGES ON ${AMAROK_DB_NAME}.* TO '${AMAROK_DB_USER_NAME}' IDENTIFIED BY '${AMAROK_DB_USER_PWD}'; FLUSH PRIVILEGES;"
	fi
	einfo "${PN} MySQL database 'amarokdb' successfully initialized!"
}
