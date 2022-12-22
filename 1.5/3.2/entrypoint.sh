#!/bin/bash

if [ ! -e /cf-config/bootstrap ]; then
	cp -va /bootstrap-config /cf-config/bootstrap
fi

if [ ! -e /cf-config/current ]; then
	ln -s bootstrap /cf-config/current
fi

exec bash /buildroot/ambassador/python/entrypoint.sh
