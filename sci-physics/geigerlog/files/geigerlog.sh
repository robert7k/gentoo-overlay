#!/bin/sh
cd /usr/share/geigerlog || exit 1
if [ ! -f "${HOME}/.geigerlog/gconfig/geigerlog.cfg" ]; then
	mkdir -p "${HOME}/.geigerlog/gconfig"
	cp /usr/share/geigerlog/gconfig/geigerlog.cfg "${HOME}/.geigerlog/gconfig/"
fi
exec @PYTHON@ /usr/share/geigerlog/gmain.py "$@"
