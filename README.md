# robert7k Gentoo overlay

Build status: [![pkgcheck](https://github.com/robert7k/gentoo-overlay/actions/workflows/ci.yml/badge.svg)](https://github.com/robert7k/gentoo-overlay/actions/workflows/ci.yml)

Feel free to open issues or PRs.

## Usage

Add and enable this repository using `app-eselect/eselect-repository`:

```
eselect repository enable robert7k
```

**or**

Manually add this to `/etc/portage/repos.conf/robert7k.conf`:

```
[robert7k]
location = /var/db/repos/robert7k
sync-type = git
sync-uri = https://github.com/robert7k/gentoo-overlay.git
auto-sync = yes
```
